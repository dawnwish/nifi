<%--
 Licensed to the Apache Software Foundation (ASF) under one or more
  contributor license agreements.  See the NOTICE file distributed with
  this work for additional information regarding copyright ownership.
  The ASF licenses this file to You under the Apache License, Version 2.0
  (the "License"); you may not use this file except in compliance with
  the License.  You may obtain a copy of the License at

      http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
--%>
<%@ page contentType="text/html" pageEncoding="UTF-8" session="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div id="bulletin-board">
    <div id="bulletin-board-header-and-filter">
        <div id="bulletin-board-header-text"><fmt:message key="partials.bulletin-board.bulletin-board-content.bulletin-board-header-text"/></div>
        <div id="bulletin-board-filter-controls">
            <div id="bulletin-board-filter-container">
                <input type="text" id="bulletin-board-filter"/>
                <div id="bulletin-board-filter-type"></div>
            </div>
        </div>
    </div>
    <div id="bulletin-board-refresh-container">
		<fmt:message key="partials.bulletin-board.bulletin-board-content.refresh-button" var="refresh-button"/>
        <div id="refresh-button" class="bulletin-board-refresh pointer" title="${refresh_button}"></div>
        <div id="bulletin-board-last-refreshed-container">
		<fmt:message key="partials.bulletin-board.bulletin-board-content.bulletin-board-last-refreshed-container"/>:&nbsp;<span id="bulletin-board-last-refreshed"></span>
        </div>
        <div id="bulletin-board-loading-container" class="loading-container"></div>
        <div id="bulletin-board-status-container">
            <div id="bulletin-error-message"></div>
            <div id="clear-bulletins-button" class="button-normal pointer"><fmt:message key="partials.bulletin-board.Clear"/></div>
        </div>
    </div>
    <div id="bulletin-board-container"></div>
</div>
