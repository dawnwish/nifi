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
<div id="history">
    <div id="history-header-text"><fmt:message key="partials.history.history-content.history-header-text"/></div>
    <div id="history-refresh-container">
        <fmt:message key="partials.history.history-content.Refresh" var="Refresh"/>
        <div id="refresh-button" class="history-refresh pointer" title="${Refresh}"></div>
        <div id="history-last-refreshed-container">
            <fmt:message key="partials.history.history-content.LastUpdated"/><span id="history-last-refreshed"></span>
        </div>
        <div id="history-loading-container" class="loading-container"></div>
        <div id="history-filter-container">
            <div id="history-filter-overview">
                <fmt:message key="partials.history.history-content.history-filter-overview"/>&nbsp;
                <span id="clear-history-filter"><fmt:message key="partials.history.history-content.clear-history-filter"/></span>
            </div>
            <div id="history-filter-button" class="button button-normal pointer"><fmt:message key="partials.history.history-content.Filter"/></div>
            <div id="history-purge-button" class="button button-normal pointer hidden"><fmt:message key="partials.history.history-content.Purge"/></div>
        </div>
    </div>
    <div id="history-table"></div>
</div>
