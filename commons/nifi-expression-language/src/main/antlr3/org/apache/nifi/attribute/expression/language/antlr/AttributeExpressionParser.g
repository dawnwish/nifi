/*
 * Licensed to the Apache Software Foundation (ASF) under one or more
 * contributor license agreements.  See the NOTICE file distributed with
 * this work for additional information regarding copyright ownership.
 * The ASF licenses this file to You under the Apache License, Version 2.0
 * (the "License"); you may not use this file except in compliance with
 * the License.  You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
parser grammar AttributeExpressionParser;

options {
	output=AST;
	tokenVocab=AttributeExpressionLexer;
}

tokens {
	QUERY;
	ATTRIBUTE_REFERENCE;
	ATTR_NAME;
	FUNCTION_CALL;
	EXPRESSION;
	MULTI_ATTRIBUTE_REFERENCE;
	QUOTED_ATTR_NAME;
}

@header {
	package org.apache.nifi.attribute.expression.language.antlr;
	import org.apache.nifi.attribute.expression.language.exception.AttributeExpressionLanguageParsingException;
}

@members {
  public void displayRecognitionError(String[] tokenNames, RecognitionException e) {
  	final StringBuilder sb = new StringBuilder();
    if ( e.token == null ) {
    	sb.append("Unrecognized token ");
    } else {
    	sb.append("Unexpected token '").append(e.token.getText()).append("' ");
    }
    sb.append("at line ").append(e.line);
    if ( e.approximateLineInfo ) {
    	sb.append(" (approximately)");
    }
    sb.append(", column ").append(e.charPositionInLine);
    sb.append(". Query: ").append(e.input.toString());
    
    throw new AttributeExpressionLanguageParsingException(sb.toString());
  }

  public void recover(final RecognitionException e) {
  	final StringBuilder sb = new StringBuilder();
    if ( e.token == null ) {
    	sb.append("Unrecognized token ");
    } else {
    	sb.append("Unexpected token '").append(e.token.getText()).append("' ");
    }
    sb.append("at line ").append(e.line);
    if ( e.approximateLineInfo ) {
    	sb.append(" (approximately)");
    }
    sb.append(", column ").append(e.charPositionInLine);
    sb.append(". Query: ").append(e.input.toString());
    
    throw new AttributeExpressionLanguageParsingException(sb.toString());
  } 
}

// functions that return Strings
zeroArgString : (TO_UPPER | TO_LOWER | TRIM | TO_STRING | URL_ENCODE | URL_DECODE) LPAREN! RPAREN!;
oneArgString : ((SUBSTRING_BEFORE | SUBSTRING_BEFORE_LAST | SUBSTRING_AFTER | SUBSTRING_AFTER_LAST | REPLACE_NULL | 
				PREPEND | APPEND | FORMAT | STARTS_WITH | ENDS_WITH | CONTAINS) LPAREN! anyArg RPAREN!) |
			   (TO_RADIX LPAREN! anyArg (COMMA! anyArg)? RPAREN!);
twoArgString : ((REPLACE | REPLACE_ALL) LPAREN! anyArg COMMA! anyArg RPAREN!) |
			   (SUBSTRING LPAREN! anyArg (COMMA! anyArg)? RPAREN!);


// functions that return Booleans
zeroArgBool : (IS_NULL | NOT_NULL | NOT) LPAREN! RPAREN!;
oneArgBool	: ((FIND | MATCHES | EQUALS_IGNORE_CASE) LPAREN! anyArg RPAREN!) |
			  (GREATER_THAN | LESS_THAN | GREATER_THAN_OR_EQUAL | LESS_THAN_OR_EQUAL) LPAREN! anyArg RPAREN! |
			  (EQUALS) LPAREN! anyArg RPAREN! |
			  (AND | OR) LPAREN! anyArg RPAREN!;


// functions that return Numbers
zeroArgNum	: (LENGTH | TO_NUMBER) LPAREN! RPAREN!;
oneArgNum	: ((INDEX_OF | LAST_INDEX_OF) LPAREN! anyArg RPAREN!) |
			  (TO_DATE LPAREN! anyArg? RPAREN!) |
			  ((MOD | PLUS | MINUS | MULTIPLY | DIVIDE) LPAREN! anyArg RPAREN!);

stringFunctionRef : zeroArgString | oneArgString | twoArgString;
booleanFunctionRef : zeroArgBool | oneArgBool;
numberFunctionRef : zeroArgNum | oneArgNum;

anyArg : NUMBER | numberFunctionRef | STRING_LITERAL | zeroArgString | oneArgString | twoArgString | booleanLiteral | zeroArgBool | oneArgBool | expression;
stringArg : STRING_LITERAL | zeroArgString | oneArgString | twoArgString | expression;
functionRef : stringFunctionRef | booleanFunctionRef | numberFunctionRef;



// Attribute Reference
subject : attrName | expression;
attrName : singleAttrName | multiAttrName;

singleAttrRef : ATTRIBUTE_NAME | STRING_LITERAL;
singleAttrName : singleAttrRef ->
	^(ATTR_NAME singleAttrRef);
	

multiAttrFunction : ANY_ATTRIBUTE | ANY_MATCHING_ATTRIBUTE | ALL_ATTRIBUTES | ALL_MATCHING_ATTRIBUTES | ANY_DELINEATED_VALUE | ALL_DELINEATED_VALUES;
multiAttrName : multiAttrFunction LPAREN stringArg (COMMA stringArg)* RPAREN ->
	^(MULTI_ATTRIBUTE_REFERENCE multiAttrFunction stringArg*);

attributeRef : subject ->
	^(ATTRIBUTE_REFERENCE subject);
	

functionCall : functionRef ->
	^(FUNCTION_CALL functionRef);

booleanLiteral : TRUE | FALSE;
zeroArgStandaloneFunction : (IP | UUID | NOW | NEXT_INT | HOSTNAME) LPAREN! RPAREN!;
oneArgStandaloneFunction : HOSTNAME^ LPAREN! booleanLiteral RPAREN!;
standaloneFunction : zeroArgStandaloneFunction | oneArgStandaloneFunction;

attributeRefOrFunctionCall	: (attributeRef | standaloneFunction);

expression : DOLLAR LBRACE attributeRefOrFunctionCall (COLON functionCall)* RBRACE ->
	^(EXPRESSION attributeRefOrFunctionCall functionCall*);

query : expression EOF ->
	^(QUERY expression);