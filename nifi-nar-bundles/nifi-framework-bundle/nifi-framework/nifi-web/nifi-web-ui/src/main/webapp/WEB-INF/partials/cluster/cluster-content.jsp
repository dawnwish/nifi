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
<div id="cluster">
    <div id="cluster-header-and-filter">
        <div id="cluster-header-text"><fmt:message key="partials.cluster.cluster-content.NiFiCluster"/></div>
        <div id="cluster-filter-controls">
            <div id="cluster-filter-container">
                <input type="text" id="cluster-filter"/>
                <div id="cluster-filter-type"></div>
            </div>
            <div id="cluster-filter-stats">
                <fmt:message key="partials.cluster.cluster-content.Displaying"/><span id="displayed-nodes"></span><fmt:message key="partials.cluster.cluster-content.Of"/><span id="total-nodes"></span>
            </div>
        </div>
    </div>
    <div id="cluster-refresh-container">
        <fmt:message key="partials.cluster.cluster-content.Refresh" var="Refresh"/>
        <div id="refresh-button" class="cluster-refresh pointer" title="${Refresh}"></div>
        <div id="cluster-last-refreshed-container">
            <fmt:message key="partials.cluster.cluster-content.LastUpdated"/><span id="cluster-last-refreshed"></span>
        </div>
        <div id="cluster-loading-container" class="loading-container"></div>
    </div>
    <div id="cluster-table"></div>
</div>
