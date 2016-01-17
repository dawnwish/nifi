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
<div id="connection-details">
    <div class="connection-details-tab-container">
        <div id="connection-details-tabs"></div>
        <div id="connection-details-tabs-content">
            <div id="read-only-connection-details-tab-content" class="configuration-tab">
                <div class="settings-left">
                    <div class="setting">
                        <div id="read-only-connection-source-label" class="setting-name"></div>
                        <div class="setting-field connection-terminal-label">
                            <div id="read-only-connection-source"></div>
                        </div>
                    </div>
                    <div class="setting">
                        <div class="setting-name"><fmt:message key="partials.connection-details.WithinGroup"/></div>
                        <div class="setting-field">
                            <div id="read-only-connection-source-group-name"></div>
                        </div>
                    </div>
                    <div id="read-only-relationship-names-container" class="setting">
                        <div class="setting-name">
                            <fmt:message key="partials.connection-details.Relationships"/>
                            <fmt:message key="partials.connection-details.configuration-tab.read-only-relationship-names-container.title" var="title_read_only_relationship_names_container"/>
                            <img class="setting-icon icon-info" src="images/iconInfo.png" alt="Info" title="${title_read_only_relationship_names_container}"/>
                        </div>
                        <div class="setting-field">
                            <div id="read-only-relationship-names"></div>
                        </div>
                    </div>
                </div>
                <div class="spacer">&nbsp;</div>
                <div class="settings-right">
                    <div class="setting">
                        <div id="read-only-connection-target-label" class="setting-name"></div>
                        <div class="setting-field connection-terminal-label">
                            <div id="read-only-connection-target"></div>
                        </div>
                    </div>
                    <div class="setting">
                        <div class="setting-name"><fmt:message key="partials.connection-details.WithinGroup"/></div>
                        <div class="setting-field">
                            <div id="read-only-connection-target-group-name"></div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="read-only-connection-settings-tab-content" class="configuration-tab">
                <div class="settings-left">
                    <div class="setting">
                        <div class="setting-name"><fmt:message key="partials.connection-details.Name"/></div>
                        <div class="setting-field">
                            <span id="read-only-connection-name"></span>
                        </div>
                    </div>
                    <div class="setting">
                        <div class="setting-name"><fmt:message key="partials.connection-details.Id"/></div>
                        <div class="setting-field">
                            <span id="read-only-connection-id"></span>
                        </div>
                    </div>
                    <div class="setting">
                        <div class="setting-name">
                            <fmt:message key="partials.connection-details.read-only-flow-file-expiration"/>
                            <fmt:message key="partials.connection-details.read-only-flow-file-expiration.title" var="title_read_only_flow_file_expiration"/>
                            <img class="setting-icon icon-info" src="images/iconInfo.png" alt="Info" title="${title_read_only_flow_file_expiration}"/>
                        </div>
                        <div class="setting-field">
                            <span id="read-only-flow-file-expiration"></span>
                        </div>
                        <div class="clear"></div>
                    </div>
                    <div class="setting">
                        <div class="setting-name">
                            <fmt:message key="partials.connection-details.read-only-back-pressure-object-threshold"/>
                            <fmt:message key="partials.connection-details.read-only-back-pressure-object-threshold.title" var="title_read_only_back_pressure_object_threshold"/>
                            <img class="setting-icon icon-info" src="images/iconInfo.png" alt="Info" title="${title_read_only_back_pressure_object_threshold}"/>
                        </div>
                        <div class="setting-field">
                            <span id="read-only-back-pressure-object-threshold"></span>
                        </div>
                        <div class="clear"></div>
                    </div>
                    <div class="setting">
                        <div class="setting-name">
                            <fmt:message key="partials.connection-details.read-only-back-pressure-data-size-threshold"/>
                            <fmt:message key="partials.connection-details.read-only-back-pressure-data-size-threshold.title" var="title_read_only_back_pressure_data_size_threshold"/>
                            <img class="setting-icon icon-info" src="images/iconInfo.png" alt="Info" title="${title_read_only_back_pressure_data_size_threshold}"/>
                        </div>
                        <div class="setting-field">
                            <span id="read-only-back-pressure-data-size-threshold"></span>
                        </div>
                        <div class="clear"></div>
                    </div>
                </div>
                <div class="spacer">&nbsp;</div>
                <div class="settings-right">
                    <div class="setting">
                        <div class="setting-name">
                            <fmt:message key="partials.connection-details.read-only-prioritizers"/>
                            <img class="setting-icon icon-info" src="images/iconInfo.png" alt="Info" title="<fmt:message key="partials.connection-details.read-only-prioritizers"/>that have been selected to reprioritize FlowFiles in this processors work queue."/>
                        </div>
                        <div class="setting-field">
                            <div id="read-only-prioritizers"></div>
                        </div>
                        <div class="clear"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
