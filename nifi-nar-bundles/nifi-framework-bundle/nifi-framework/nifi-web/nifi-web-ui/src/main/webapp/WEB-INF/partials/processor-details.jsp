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
<div id="processor-details">
    <div class="processor-details-tab-container">
        <div id="processor-details-tabs"></div>
        <div id="processor-details-tabs-content">
            <div id="details-standard-settings-tab-content" class="details-tab">
                <div class="settings-left">
                    <div class="setting">
                        <div class="setting-name"><fmt:message key="partials.processor-details.read-only-processor-name"/></div>
                        <div class="setting-field">
                            <span id="read-only-processor-name"></span>
                        </div>
                        <div class="clear"></div>
                    </div>
                    <div class="setting">
                        <div class="setting-name"><fmt:message key="partials.processor-details.read-only-processor-id"/></div>
                        <div class="setting-field">
                            <span id="read-only-processor-id"></span>
                        </div>
                    </div>
                    <div class="setting">
                        <div class="setting-name"><fmt:message key="partials.processor-details.read-only-processor-type"/></div>
                        <div class="setting-field">
                            <span id="read-only-processor-type"></span>
                        </div>
                        <div class="clear"></div>
                    </div>
                    <div class="setting">
                        <div class="penalty-duration-setting">
                            <div class="setting-name">
                                <fmt:message key="partials.processor-details.read-only-penalty-duration"/>
                                <fmt:message key="partials.processor-details.read-only-penalty-duration.title" var="title_read_only_penalty_duration"/>
                                <img class="setting-icon icon-info" src="images/iconInfo.png" alt="Info" title="${title_read_only_penalty_duration}"/>
                            </div>
                            <div class="setting-field">
                                <span id="read-only-penalty-duration"></span>
                            </div>
                        </div>
                        <div class="yield-duration-setting">
                            <div class="setting-name">
                                <fmt:message key="partials.processor-details.read-only-yield-duration"/>
                                <fmt:message key="partials.processor-details.read-only-yield-duration.title" var="title_read_only_yield_duration"/>
                                <img class="setting-icon icon-info" src="images/iconInfo.png" alt="Info" title="${title_read_only_yield_duration}"/>
                            </div>
                            <div class="setting-field">
                                <span id="read-only-yield-duration"></span>
                            </div>
                        </div>
                        <div class="clear"></div>
                    </div>
                    <div class="setting">
                        <div class="bulletin-setting">
                            <div class="setting-name">
                                <fmt:message key="partials.processor-details.read-only-bulletin-level"/>
                                <fmt:message key="partials.processor-details.read-only-bulletin-level.title" var="title_read_only_bulletin_level"/>
                                <img class="setting-icon icon-info" src="images/iconInfo.png" alt="Info" title="${title_read_only_bulletin_level}"/>
                            </div>
                            <div class="setting-field">
                                <span id="read-only-bulletin-level"></span>
                            </div>
                        </div>
                        <div class="clear"></div>
                    </div>
                </div>
                <div class="spacer">&nbsp;</div>
                <div class="settings-right">
                    <div class="setting">
                        <div class="setting-name">
                            <fmt:message key="partials.processor-details.read-only-auto-terminate-relationship-names"/>
                            <fmt:message key="partials.processor-details.read-only-auto-terminate-relationship-names.title" var="title_read_only_auto_terminate_relationship_names"/>
                            <img class="setting-icon icon-info" src="images/iconInfo.png" alt="Info" title="${title_read_only_auto_terminate_relationship_names}"/>
                        </div>
                        <div class="setting-field">
                            <div id="read-only-auto-terminate-relationship-names"></div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="details-scheduling-tab-content" class="details-tab">
                <div class="settings-left">
                    <div class="setting">
                        <div class="scheduling-strategy-setting">
                            <div class="setting-name">
                                <fmt:message key="partials.processor-details.read-only-scheduling-strategy"/>
                                <fmt:message key="partials.processor-details.read-only-scheduling-strategy.title" var="title_read_only_scheduling_strategy"/>
                                <img class="setting-icon icon-info" src="images/iconInfo.png" alt="Info" title="${title_read_only_scheduling_strategy}"/>
                            </div>
                            <div class="setting-field">
                                <span id="read-only-scheduling-strategy"></span>
                            </div>
                        </div>
                        <div class="clear"></div>
                    </div>
                    <div class="setting">
                        <div class="concurrently-schedulable-tasks-setting">
                            <div class="setting-name">
                                <fmt:message key="partials.processor-details.read-only-concurrently-schedulable-tasks"/>
                                <fmt:message key="partials.processor-details.read-only-concurrently-schedulable-tasks.title" var="title_read_only_concurrently_schedulable_tasks"/>
                                <img class="setting-icon icon-info" src="images/iconInfo.png" alt="Info" title="${title_read_only_concurrently_schedulable_tasks}"/>
                            </div>
                            <div class="setting-field">
                                <span id="read-only-concurrently-schedulable-tasks"></span>
                            </div>
                        </div>
                        <div id="read-only-run-schedule" class="scheduling-period-setting">
                            <div class="setting-name">
                                <fmt:message key="partials.processor-details.read-only-scheduling-period"/>
                                <fmt:message key="partials.processor-details.read-only-scheduling-period.title" var="title_read_only_scheduling_period"/>
                                <img class="setting-icon icon-info" src="images/iconInfo.png" alt="Info" title="${title_read_only_scheduling_period}"/>
                            </div>
                            <div class="setting-field">
                                <span id="read-only-scheduling-period"></span>
                            </div>
                        </div>
                        <div class="clear"></div>
                    </div>
                </div>
                <div class="spacer">&nbsp;</div>
                <div class="settings-right">
                    <div class="setting">
                        <div class="setting-name">
                            <fmt:message key="partials.processor-details.read-only-run-duration"/>
                            <img class="setting-icon icon-info" src="images/iconInfo.png" alt="Info"
                                 <fmt:message key="partials.processor-details.read-only-run-duration.title" var="title_read_only_run_duration"/>
                                 title="${title_read_only_run_duration}"/>
                        </div>
                        <div class="setting-field">
                            <span id="read-only-run-duration"></span>
                        </div>
                    </div>
                </div>
            </div>
            <div id="details-processor-properties-tab-content" class="details-tab">
                <div id="read-only-processor-properties"></div>
            </div>
            <div id="details-processor-comments-tab-content" class="details-tab">
                <div class="setting">
                    <div class="setting-name"><fmt:message key="partials.processor-details.read-only-processor-comments"/></div>
                    <div class="setting-field">
                        <div id="read-only-processor-comments"></div>
                    </div>
                    <div class="clear"></div>
                </div>
            </div>
        </div>
    </div>
</div>
