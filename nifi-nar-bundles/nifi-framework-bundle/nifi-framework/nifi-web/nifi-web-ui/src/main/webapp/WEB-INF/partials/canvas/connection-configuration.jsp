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
<div id="connection-configuration">
    <div class="connection-configuration-tab-container">
        <div id="connection-configuration-tabs"></div>
        <div id="connection-configuration-tabs-content">
            <div id="connection-settings-tab-content" class="configuration-tab">
                <div class="settings-left">
                    <div class="setting">
                        <div class="setting-name"><fmt:message key="partials.canvas.connection-configuration.Name"/></div>
                        <div class="setting-field">
                            <input type="text" id="connection-name" name="connection-name" class="setting-input"/>
                        </div>
                    </div>
                    <div class="setting">
                        <div class="setting-name"><fmt:message key="partials.canvas.connection-configuration.Id"/></div>
                        <div class="setting-field">
                            <span type="text" id="connection-id"></span>
                        </div>
                    </div>
                    <div class="setting">
                        <div class="setting-name">
                            <fmt:message key="partials.canvas.connection-configuration.FlowFileExpiration"/>
                            <fmt:message key="partials.canvas.connection-configuration.FlowFileExpiration.title" var="title_FlowFileExpiration"/>
                            <img class="setting-icon icon-info" src="images/iconInfo.png" alt="Info" title="${title_FlowFileExpiration}"/>
                        </div>
                        <div class="setting-field">
                            <input type="text" id="flow-file-expiration" name="flow-file-expiration" class="setting-input"/>
                        </div>
                    </div>
                    <div class="setting">
                        <div class="setting-name">
                            <fmt:message key="partials.canvas.connection-configuration.BackPressureObjectThreshold"/>
                            <fmt:message key="partials.canvas.connection-configuration.BackPressureObjectThreshold.Title" var="Title"/>
                            <img class="setting-icon icon-info" src="images/iconInfo.png" alt="Info" title="${Title}"/>
                        </div>
                        <div class="setting-field">
                            <input type="text" id="back-pressure-object-threshold" name="back-pressure-object-threshold" class="setting-input"/>
                        </div>
                    </div>
                    <div class="setting">
                        <div class="setting-name">
                            <fmt:message key="partials.canvas.connection-configuration.BackPressureDataSizeThreshold"/>
                            <fmt:message key="partials.canvas.connection-configuration.BackPressureDataSizeThreshold.Title" var="Title"/>
                            <img class="setting-icon icon-info" src="images/iconInfo.png" alt="Info" title="${Title}"/>
                        </div>
                        <div class="setting-field">
                            <input type="text" id="back-pressure-data-size-threshold" name="back-pressure-data-size-threshold" class="setting-input"/>
                        </div>
                    </div>
                </div>
                <div class="spacer">&nbsp;</div>
                <div class="settings-right">
                    <div class="setting">
                        <div class="setting-name">
                            <fmt:message key="partials.canvas.connection-configuration.AvailablePrioritizers"/>
                            <img class="setting-icon icon-info" src="images/iconInfo.png" alt="Info" title="<fmt:message key="partials.canvas.connection-configuration.AvailablePrioritizers"/>that could reprioritize FlowFiles in this work queue."/>
                        </div>
                        <div class="setting-field">
                            <ul id="prioritizer-available"></ul>
                        </div>
                    </div>
                    <div class="setting">
                        <div class="setting-name">
                            Selected prioritizers
                            <fmt:message key="partials.canvas.connection-configuration.SelectedPrioritizers.title" var="title_SelectedPrioritizers"/>
                            <img class="setting-icon icon-info" src="images/iconInfo.png" alt="Info" title="${title_SelectedPrioritizers}"/>
                        </div>
                        <div class="setting-field">
                            <ul id="prioritizer-selected"></ul>
                        </div>
                    </div>
                </div>
                <input type="hidden" id="connection-uri" name="connection-uri"/>
                <input type="hidden" id="connection-source-component-id" name="connection-source-component-id"/>
                <input type="hidden" id="connection-source-id" name="connection-source-id"/>
                <input type="hidden" id="connection-source-group-id" name="connection-source-group-id"/>
                <input type="hidden" id="connection-destination-component-id" name="connection-destination-component-id"/>
                <input type="hidden" id="connection-destination-id" name="connection-destination-id"/>
                <input type="hidden" id="connection-destination-group-id" name="connection-destination-group-id"/>
            </div>
            <div id="connection-details-tab-content" class="configuration-tab">
                <div class="settings-left">
                    <div id="read-only-output-port-source" class="setting hidden">
                        <div class="setting-name"><fmt:message key="partials.canvas.connection-configuration.FromOutput"/></div>
                        <div class="setting-field connection-terminal-label">
                            <div id="read-only-output-port-name"></div>
                        </div>
                    </div>
                    <div id="output-port-source" class="setting hidden">
                        <div class="setting-name"><fmt:message key="partials.canvas.connection-configuration.FromOutput"/></div>
                        <div class="setting-field connection-terminal-label">
                            <div id="output-port-options"></div>
                        </div>
                    </div>
                    <div id="input-port-source" class="setting hidden">
                        <div class="setting-name"><fmt:message key="partials.canvas.connection-configuration.FromInput"/></div>
                        <div class="setting-field connection-terminal-label">
                            <div id="input-port-source-name" class="label"></div>
                        </div>
                    </div>
                    <div id="funnel-source" class="setting hidden">
                        <div class="setting-name"><fmt:message key="partials.canvas.connection-configuration.FromFunnel"/></div>
                        <div class="setting-field connection-terminal-label">
                            <div id="funnel-source-name" class="label"><fmt:message key="partials.canvas.connection-configuration.Funnel"/></div>
                        </div>
                    </div>
                    <div id="processor-source" class="setting hidden">
                        <div class="setting-name"><fmt:message key="partials.canvas.connection-configuration.FromProcessor"/></div>
                        <div class="setting-field connection-terminal-label">
                            <div id="processor-source-details">
                                <div id="processor-source-name" class="label"></div>
                                <div id="processor-source-type"></div>
                            </div>
                        </div>
                    </div>
                    <div id="connection-source-group" class="setting">
                        <div class="setting-name"><fmt:message key="partials.canvas.connection-configuration.WithinGroup"/></div>
                        <div class="setting-field">
                            <div id="connection-source-group-name"></div>
                        </div>
                    </div>
                    <div id="relationship-names-container" class="hidden">
                        <div class="setting-name"><fmt:message key="partials.canvas.connection-configuration.ForRelationships"/></div>
                        <div class="setting-field">
                            <div id="relationship-names"></div>
                        </div>
                    </div>
                </div>
                <div class="spacer">&nbsp;</div>
                <div class="settings-right">
                    <div id="input-port-destination" class="setting hidden">
                        <div class="setting-name"><fmt:message key="partials.canvas.connection-configuration.ToInput"/></div>
                        <div class="setting-field connection-terminal-label">
                            <div id="input-port-options"></div>
                        </div>
                    </div>
                    <div id="output-port-destination" class="setting hidden">
                        <div class="setting-name"><fmt:message key="partials.canvas.connection-configuration.ToOutput"/></div>
                        <div class="setting-field connection-terminal-label">
                            <div id="output-port-destination-name" class="label"></div>
                        </div>
                    </div>
                    <div id="funnel-destination" class="setting hidden">
                        <div class="setting-name"><fmt:message key="partials.canvas.connection-configuration.ToFunnel"/></div>
                        <div class="setting-field connection-terminal-label">
                            <div id="funnel-source-name" class="label"><fmt:message key="partials.canvas.connection-configuration.Funnel"/></div>
                        </div>
                    </div>
                    <div id="processor-destination" class="setting hidden">
                        <div class="setting-name"><fmt:message key="partials.canvas.connection-configuration.ToProcessor"/></div>
                        <div class="setting-field connection-terminal-label">
                            <div id="processor-destination-details">
                                <div id="processor-destination-name" class="label"></div>
                                <div id="processor-destination-type"></div>
                            </div>
                        </div>
                    </div>
                    <div id="connection-destination-group" class="setting">
                        <div class="setting-name"><fmt:message key="partials.canvas.connection-configuration.WithinGroup"/></div>
                        <div class="setting-field">
                            <div id="connection-destination-group-name"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>    
</div>
