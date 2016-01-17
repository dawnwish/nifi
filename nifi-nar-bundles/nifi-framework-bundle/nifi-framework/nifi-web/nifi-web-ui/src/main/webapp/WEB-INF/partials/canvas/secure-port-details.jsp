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
<div id="secure-port-details">
    <div class="dialog-content">
        <div id="secure-port-details-tabs"></div>
        <div id="secure-port-details-tabs-content">
            <div id="read-only-secure-port-settings-tab-content" class="configuration-tab">
                <div class="secure-port-setting">
                    <div class="setting-name"><fmt:message key="partials.canvas.secure-port-details.PortName"/></div>
                    <div class="setting-field">
                        <div id="read-only-secure-port-name"></div>
                    </div>
                </div>
                <div class="secure-port-setting">
                    <div class="setting-name"><fmt:message key="partials.canvas.secure-port-details.Id"/></div>
                    <div class="setting-field">
                        <span id="read-only-secure-port-id"></span>
                    </div>
                </div>
                <div id="secure-port-concurrent-task-container" class="secure-port-setting">
                    <div class="setting-name">
                        <fmt:message key="partials.canvas.secure-port-details.ConcurrentTasks"/>
                        <fmt:message key="partials.canvas.secure-port-details.ConcurrentTasks.title" var="title_ConcurrentTasks"/>
                        <img class="setting-icon icon-info" src="images/iconInfo.png" alt="Info" title="${title_ConcurrentTasks}"/>
                    </div>
                    <div class="setting-field">
                        <div id="read-only-secure-port-concurrent-tasks"></div>
                    </div>
                </div>
                <div class="secure-port-setting">
                    <div class="setting-name"><fmt:message key="partials.canvas.secure-port-details.Comments"/></div>
                    <div class="setting-field">
                        <div id="read-only-secure-port-comments"></div>
                    </div>
                </div>
            </div>
            <div id="read-only-secure-port-access-control-tab-content" class="configuration-tab">
                <div class="secure-port-setting">
                    <div class="setting-name"><fmt:message key="partials.canvas.secure-port-details.AllowedUsers"/></div>
                    <div class="setting-field allowed-container">
                        <ul id="read-only-allowed-users" class="allowed"></ul>
                    </div>
                </div>
                <div class="secure-port-setting">
                    <div class="setting-name"><fmt:message key="partials.canvas.secure-port-details.AllowedGroups"/></div>
                    <div class="setting-field allowed-container">
                        <ul id="read-only-allowed-groups" class="allowed"></ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
