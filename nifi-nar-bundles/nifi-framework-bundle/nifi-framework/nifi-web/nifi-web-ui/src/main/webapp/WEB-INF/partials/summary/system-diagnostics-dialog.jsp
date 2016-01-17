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
<div id="system-diagnostics-dialog">
    <div id="system-diagnostics-refresh-container">
        <div id="system-diagnostics-tabs"></div>
        <fmt:message key="partials.summary.system-diagnostics-dialog.Refresh" var="Refresh"/>
        <div id="system-diagnostics-refresh-button" class="summary-refresh pointer" title="${Refresh}"></div>
        <div id="system-diagnostics-last-refreshed-container">
            <fmt:message key="partials.summary.system-diagnostics-dialog.LastUpdated"/>&nbsp;<span id="system-diagnostics-last-refreshed"></span>
        </div>
        <div id="system-diagnostics-loading-container" class="loading-container"></div>
    </div>
    <div class="dialog-content">
        <div id="jvm-tab-content" class="configuration-tab">
            <div class="settings-left">
                <div class="setting">
                    <input type="hidden" id=""/>
                    <div class="setting-name"><fmt:message key="partials.summary.system-diagnostics-dialog.Heap"/><span id="utilization-heap"></span></div>
                    <div class="setting-field">
                        <table id="heap-table">
                            <tbody>
                                <tr>
                                    <td class="memory-header"><b><fmt:message key="partials.summary.system-diagnostics-dialog.Max"/></b></td>
                                    <td><span id="max-heap"></span></td>
                                </tr>
                                <tr>
                                    <td><b><fmt:message key="partials.summary.system-diagnostics-dialog.Total"/></b></td>
                                    <td><span id="total-heap"></span></td>
                                </tr>
                                <tr>
                                    <td><b><fmt:message key="partials.summary.system-diagnostics-dialog.Used"/></b></td>
                                    <td><span id="used-heap"></span></td>
                                </tr>
                                <tr>
                                    <td><b><fmt:message key="partials.summary.system-diagnostics-dialog.Free"/></b></td>
                                    <td><span id="free-heap"></span></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="clear"></div>
                </div>
            </div>
            <div class="settings-right">
                <div class="setting">
                    <div class="setting-name"><fmt:message key="partials.summary.system-diagnostics-dialog.NonHeap"/><span id="utilization-non-heap"></span></div>
                    <div class="setting-field">
                        <table id="heap-table">
                            <tbody>
                                <tr>
                                    <td class="memory-header"><b><fmt:message key="partials.summary.system-diagnostics-dialog.Max"/></b></td>
                                    <td><span id="max-non-heap"></span></td>
                                </tr>
                                <tr>
                                    <td><b><fmt:message key="partials.summary.system-diagnostics-dialog.Total"/></b></td>
                                    <td><span id="total-non-heap"></span></td>
                                </tr>
                                <tr>
                                    <td><b><fmt:message key="partials.summary.system-diagnostics-dialog.Used"/></b></td>
                                    <td><span id="used-non-heap"></span></td>
                                </tr>
                                <tr>
                                    <td><b><fmt:message key="partials.summary.system-diagnostics-dialog.Free"/></b></td>
                                    <td><span id="free-non-heap"></span></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="clear"></div>
                </div>
            </div>
            <div class="clear"></div>
            <div class="setting">
                <div class="setting-name"><fmt:message key="partials.summary.system-diagnostics-dialog.GarbageCollection"/></div>
                <div id="garbage-collection-container" class="setting-field">
                    <table id="garbage-collection-table">
                        <tbody></tbody>
                    </table>
                </div>
            </div>
        </div>
        <div id="system-tab-content"class="configuration-tab">
            <div class="settings-left">
                <div class="setting">
                    <div class="setting-name"><fmt:message key="partials.summary.system-diagnostics-dialog.AvailableProcessors"/></div>
                    <div class="setting-field">
                        <div id="available-processors"></div>
                    </div>
                </div>
            </div>
            <div class="settings-right">
                <div class="setting">
                    <div class="setting-name">
                        <fmt:message key="partials.summary.system-diagnostics-dialog.ProcessorLoadAverage"/>
                        <fmt:message key="partials.summary.system-diagnostics-dialog.ProcessorLoadAverage.title" var="title_ProcessorLoadAverage"/>
                        <img class="setting-icon icon-info" src="images/iconInfo.png" alt="Info" title="${title_ProcessorLoadAverage}"/>
                    </div>
                    <div class="setting-field">
                        <div id="processor-load-average"></div>
                    </div>
                </div>
            </div>
            <div class="clear"></div>
            <div class="setting">
                <div class="setting-name"><fmt:message key="partials.summary.system-diagnostics-dialog.FlowFileRepositoryStorageUsage"/></div>
                <div class="setting-field">
                    <div id="flow-file-repository-storage-usage-container"></div>
                </div>
            </div>
            <div class="setting">
                <div class="setting-name"><fmt:message key="partials.summary.system-diagnostics-dialog.ContentRepositoryStorageUsage"/></div>
                <div class="setting-field">
                    <div id="content-repository-storage-usage-container"></div>
                </div>
            </div>
        </div>
    </div>
</div>
