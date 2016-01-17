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
<div id="secure-port-configuration">
    <div class="dialog-content">
        <span id="secure-port-type" class="hidden"></span>
        <div id="secure-port-configuration-tabs"></div>
        <div id="secure-port-configuration-tabs-content">
            <div id="secure-port-settings-tab-content" class="configuration-tab">
                <div class="secure-port-setting">
                    <div class="setting-name"><fmt:message key="partials.canvas.secure-port-configuration.PortName"/></div>
                    <div class="setting-field">
                        <input type="text" id="secure-port-name"/>
                        <div class="port-enabled-container">
                            <div id="secure-port-enabled" class="port-enabled nf-checkbox checkbox-unchecked"></div>
                            <span><fmt:message key="partials.canvas.secure-port-configuration.Enable"/>d</span>
                        </div>
                        <div class="clear"></div>
                    </div>
                </div>
                <div class="secure-port-setting">
                    <div class="setting-name">
                        <fmt:message key="partials.canvas.secure-port-configuration.Id"/>
                    </div>
                    <div class="setting-field">
                        <span id="secure-port-id"></span>
                    </div>
                </div>
                <div id="secure-port-concurrent-task-container" class="secure-port-setting">
                    <div class="setting-name">
                        <fmt:message key="partials.canvas.secure-port-configuration.ConcurrentTasks"/>
                        <fmt:message key="partials.canvas.secure-port-configuration.ConcurrentTasks.title" var="title_ConcurrentTasks"/>
                        <img class="setting-icon icon-info" src="images/iconInfo.png" alt="Info" title="${title_ConcurrentTasks}"/>
                    </div>
                    <div class="setting-field">
                        <input type="text" id="secure-port-concurrent-tasks" class="secure-port-field"></input>
                    </div>
                </div>
                <div class="secure-port-setting">
                    <div class="setting-name"><fmt:message key="partials.canvas.secure-port-configuration.Comments"/></div>
                    <div class="setting-field">
                        <textarea cols="30" rows="4" id="secure-port-comments" class="secure-port-field"></textarea>
                    </div>
                </div>
            </div>
            <div id="secure-port-access-control-tab-content" class="configuration-tab">
                <div class="secure-port-setting">
                    <div class="setting-name"><fmt:message key="partials.canvas.secure-port-configuration.SearchUsers"/></div>
                    <div class="setting-field">
                        <input type="text" id="secure-port-access-control" class="secure-port-field"/>
                    </div>
                </div>
                <div class="secure-port-setting">
                    <div class="setting-name"><fmt:message key="partials.canvas.secure-port-configuration.AllowedUsers"/></div>
                    <div class="setting-field allowed-container">
                        <ul id="allowed-users" class="allowed"></ul>
                    </div>
                </div>
                <div class="secure-port-setting">
                    <div class="setting-name"><fmt:message key="partials.canvas.secure-port-configuration.AllowedGroups"/></div>
                    <div class="setting-field allowed-container">
                        <ul id="allowed-groups" class="allowed"></ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div id="search-users-results"></div>
