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
<div id="user-roles-dialog">
    <div class="dialog-content">
        <div class="setting">
            <input type="hidden" id="user-id-roles-dialog"/>
            <div class="setting-name"><fmt:message key="partials.users.user-roles-dialog.User"/></div>
            <div class="setting-field">
                <span id="user-name-roles-dialog"></span>
            </div>
            <div class="clear"></div>
        </div>
        <div class="setting">
            <div class="setting-name"><fmt:message key="partials.users.user-roles-dialog.Justification"/></div>
            <div class="setting-field">
                <div id="user-justification-roles-dialog"></div>
            </div>
            <div class="clear"></div>
        </div>
        <div class="setting">
            <div class="setting-name"><fmt:message key="partials.users.user-roles-dialog.Roles"/></div>
            <div class="roles-container">
                <div class="role-container">
                    <div id="role-admin-checkbox" class="role-checkbox nf-checkbox checkbox-unchecked"></div><div class="role-name"><fmt:message key="partials.users.user-roles-dialog.Administrator"/></div>
                </div>
                <div class="role-container">
                    <div id="role-dfm-checkbox" class="role-checkbox nf-checkbox checkbox-unchecked"></div><div class="role-name"><fmt:message key="partials.users.user-roles-dialog.DataFlowManager"/></div>
                </div>
                <div class="role-container">
                    <div id="role-monitor-checkbox" class="role-checkbox nf-checkbox checkbox-unchecked"></div><div class="role-name"><fmt:message key="partials.users.user-roles-dialog.ReadOnly"/></div>
                </div>
                <div class="role-container" style="margin-top: 5px;">
                    <div id="role-provenance-checkbox" class="role-checkbox nf-checkbox checkbox-unchecked"></div><div class="role-name"><fmt:message key="partials.users.user-roles-dialog.Provenance"/></div>
                </div>
                <div class="role-container" style="margin-top: 5px;">
                    <div id="role-nifi-checkbox" class="role-checkbox nf-checkbox checkbox-unchecked"></div><div class="role-name"><fmt:message key="partials.users.user-roles-dialog.NiFi"/></div>
                </div>
                <div class="role-container">
                    <div id="role-proxy-checkbox" class="role-checkbox nf-checkbox checkbox-unchecked"></div><div class="role-name"><fmt:message key="partials.users.user-roles-dialog.Proxy"/></div>
                </div>
            </div>
            <div class="clear"></div>
        </div>
    </div>
</div>
