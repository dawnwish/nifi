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
<div id="remote-process-group-details">
    <div class="dialog-content">
        <div class="setting">
            <div class="setting-name"><fmt:message key="partials.canvas.remote-process-group-details.Name"/></div>
            <div class="setting-field">
                <span id="read-only-remote-process-group-name"></span>
            </div>
        </div>
        <div class="setting">
            <div class="setting-name"><fmt:message key="partials.canvas.remote-process-group-details.Id"/></div>
            <div class="setting-field">
                <span id="read-only-remote-process-group-id"></span>
            </div>
        </div>
        <div class="setting">
            <div class="setting-name"><fmt:message key="partials.canvas.remote-process-group-details.URL"/></div>
            <div class="setting-field">
                <span id="read-only-remote-process-group-url"></span>
            </div>
        </div>
        <div class="setting">
            <div class="setting-name"><fmt:message key="partials.canvas.remote-process-group-details.CommunicationsTimeout"/></div>
            <div class="setting-field">
                <span id="read-only-remote-process-group-timeout"></span>
            </div>
        </div>
        <div class="setting">
            <div class="setting-name">
                <fmt:message key="partials.canvas.remote-process-group-details.YieldDuration"/>
                <fmt:message key="partials.canvas.remote-process-group-details.YieldDuration.title" var="title_YieldDuration"/>
                <img class="setting-icon icon-info" src="images/iconInfo.png" alt="Info" title="${title_YieldDuration}"/>
            </div>
            <div class="setting-field">
                <span id="read-only-remote-process-group-yield-duration"></span>
            </div>
        </div>
    </div>
</div>
