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
<div id="header">
    <div id="nf-logo"></div>
    <div id="nf-logo-name"></div>
    <div id="toolbox-container">
        <div id="toolbox"></div>
        <div id="toolbox-right-edge"></div>
    </div>
    <div id="toolbar">
        <div id="global-controls"></div>
        <div id="utilities-container">
            <div id="utilities-border"></div>
            <div id="utility-buttons">
				<fmt:message key="partials.canvas.canvas-header.reporting-link" var="reporting_link"/>
                <div id="reporting-link" class="utility-button" title="${reporting_link}"></div>
				<fmt:message key="partials.canvas.canvas-header.counters-link" var="counters_link"/>
                <div id="counters-link" class="utility-button" title="${counters_link}"></div>
				<fmt:message key="partials.canvas.canvas-header.history-link" var="history_link"/>
                <div id="history-link" class="utility-button" title="${history_link}"></div>
				<fmt:message key="partials.canvas.canvas-header.provenance-link" var="provenance_link"/>
                <div id="provenance-link" class="utility-button" title="${provenance_link}"></div>
				<fmt:message key="partials.canvas.canvas-header.flow-settings-link" var="flow_settings_link"/>
                <div id="flow-settings-link" class="utility-button" title="${flow_settings_link}"></div>
				<fmt:message key="partials.canvas.canvas-header.templates-link" var="templates_link"/>
                <div id="templates-link" class="utility-button" title="${templates_link}"></div>
				<fmt:message key="partials.canvas.canvas-header.users-link" var="users_link"/>
                <div id="users-link" class="utility-button" title="${users_link}"><div id="has-pending-accounts" class="hidden"></div></div>
				<fmt:message key="partials.canvas.canvas-header.cluster-link" var="cluster_link"/>
                <div id="cluster-link" class="utility-button" title="${cluster_link}"></div>
				<fmt:message key="partials.canvas.canvas-header.bulletin-board-link" var="bulletin_board_link"/>
                <div id="bulletin-board-link" class="utility-button" title="${bulletin_board_link}"></div>
            </div>
        </div>
        <div id="search-container">
            <input id="search-field" type="text"/>
        </div>
    </div>
    <div id="header-links-container">
        <ul class="links">
            <li id="current-user-container">
                <div id="anonymous-user-alert" class="hidden"></div>
                <div id="current-user"></div>
                <div class="clear"></div>
            </li>
            <li id="login-link-container">
                <span id="login-link" class="link"><fmt:message key="partials.canvas.canvas-header.login"/></span>
            </li>
            <li id="logout-link-container" style="display: none;">
                <span id="logout-link" class="link"><fmt:message key="partials.canvas.canvas-header.logout"/></span>
            </li>
            <li>
                <span id="help-link" class="link"><fmt:message key="partials.canvas.canvas-header.help-link"/></span>
            </li>
            <li>
                <span id="about-link" class="link"><fmt:message key="partials.canvas.canvas-header.about-link"/></span>
            </li>
        </ul>
    </div>
</div>
<div id="search-flow-results"></div>
