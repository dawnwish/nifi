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
<div id="history-purge-dialog">
    <div class="dialog-content">
        <div class="setting" style="margin-bottom: 0px;">
            <div class="end-date-setting">
                <div class="setting-name">
                    <fmt:message key="partials.history.history-purge-dialog.EndDate"/>
                    <fmt:message key="partials.history.history-purge-dialog.EndDate.title" var="title_EndDate"/>
                    <img class="icon-info" src="images/iconInfo.png" alt="Info" title="${title_EndDate}"/>
                </div>
                <div class="setting-field">
                    <input type="text" id="history-purge-end-date" class="history-small-input"/>
                </div>
            </div>
            <div class="end-time-setting">
                <div class="setting-name">
                    <fmt:message key="partials.history.history-purge-dialog.EndTime"/>(<span class="timezone"></span>)
                    <fmt:message key="partials.history.history-purge-dialog.EndTime.title" var="title_EndTime"/>
                    <img id="purge-end-time-info" class="icon-info" src="images/iconInfo.png" alt="Info" title="${title_EndTime}"/>
                </div>
                <div class="setting-field">
                    <input type="text" id="history-purge-end-time" class="history-small-input"/>
                </div>
            </div>
            <div class="clear"></div>
        </div>
    </div>
</div>
