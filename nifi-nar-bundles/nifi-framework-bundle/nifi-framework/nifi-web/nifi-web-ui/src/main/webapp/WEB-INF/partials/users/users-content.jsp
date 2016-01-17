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
<div id="users">
    <div id="users-header-and-filter">
        <div id="users-header-text"><fmt:message key="partials.users.users-content.users-header-text"/></div>
        <div id="users-filter-controls">
            <div id="users-filter-container">
                <input type="text" id="users-filter"/>
                <div id="users-filter-type"></div>
            </div>
            <div id="users-filter-stats">
                <fmt:message key="partials.users.users-content.Displaying"/><span id="displayed-users"></span><fmt:message key="partials.users.users-content.Of"/><span id="total-users"></span>
            </div>
        </div>
    </div>
    <div id="users-refresh-container">
        <fmt:message key="partials.users.users-content.Refresh" var="Refresh"/>
        <div id="refresh-button" class="users-refresh pointer" title="${Refresh}"></div>
        <div id="users-last-refreshed-container">
            <fmt:message key="partials.users.users-content.LastUpdated"/>&nbsp;<span id="users-last-refreshed"></span>
        </div>
        <div id="users-loading-container" class="loading-container"></div>
        <div id="group-controls-container">
            <div id="group-collaspe-container">
                <div id="group-collaspe-checkbox" class="nf-checkbox checkbox-unchecked"></div>
                <span>&nbsp;<fmt:message key="partials.users.users-content.ShowByGroup"/></span>
            </div>
            <div id="group-button" class="button-normal pointer"><fmt:message key="partials.users.users-content.Group"/></div>
        </div>
    </div>
    <div id="users-table"></div>
</div>
