/*
 * Licensed to the Apache Software Foundation (ASF) under one or more
 * contributor license agreements.  See the NOTICE file distributed with
 * this work for additional information regarding copyright ownership.
 * The ASF licenses this file to You under the Apache License, Version 2.0
 * (the "License"); you may not use this file except in compliance with
 * the License.  You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
$(document).ready(function () {
    // initialize the counters page
    nf.Users.init();
});

nf.Users = (function () {

    /**
     * Configuration object used to hold a number of configuration items.
     */
    var config = {
        urls: {
            banners: '../nifi-api/controller/banners',
            controllerAbout: '../nifi-api/controller/about',
            authorities: '../nifi-api/controller/authorities'
        }
    };

    /**
     * Loads the current users authorities.
     */
    var loadAuthorities = function () {
        return $.Deferred(function (deferred) {
            $.ajax({
                type: 'GET',
                url: config.urls.authorities,
                dataType: 'json'
            }).done(function (response) {
                if (nf.Common.isDefinedAndNotNull(response.authorities)) {
                    // record the users authorities
                    nf.Common.setAuthorities(response.authorities);
                    deferred.resolve(response);
                } else {
                    deferred.reject();
                }
            }).fail(function (xhr, status, error) {
                nf.Common.handleAjaxError(xhr, status, error);
                deferred.reject();
            });
        }).promise();
    };

    var initializeUsersPage = function () {
        // define mouse over event for the refresh button
        nf.Common.addHoverEffect('#refresh-button', 'button-refresh', 'button-refresh-hover').click(function () {
            nf.UsersTable.loadUsersTable();
        });

        // get the banners if we're not in the shell
        return $.Deferred(function (deferred) {
            if (top === window) {
                $.ajax({
                    type: 'GET',
                    url: config.urls.banners,
                    dataType: 'json'
                }).done(function (bannerResponse) {
                    // ensure the banners response is specified
                    if (nf.Common.isDefinedAndNotNull(bannerResponse.banners)) {
                        if (nf.Common.isDefinedAndNotNull(bannerResponse.banners.headerText) && bannerResponse.banners.headerText !== '') {
                            // update the header text
                            var bannerHeader = $('#banner-header').text(bannerResponse.banners.headerText).show();

                            // show the banner
                            var updateTop = function (elementId) {
                                var element = $('#' + elementId);
                                element.css('top', (parseInt(bannerHeader.css('height'), 10) + parseInt(element.css('top'), 10)) + 'px');
                            };

                            // update the position of elements affected by top banners
                            updateTop('users');
                        }

                        if (nf.Common.isDefinedAndNotNull(bannerResponse.banners.footerText) && bannerResponse.banners.footerText !== '') {
                            // update the footer text and show it
                            var bannerFooter = $('#banner-footer').text(bannerResponse.banners.footerText).show();

                            var updateBottom = function (elementId) {
                                var element = $('#' + elementId);
                                element.css('bottom', parseInt(bannerFooter.css('height'), 10) + 'px');
                            };

                            // update the position of elements affected by bottom banners
                            updateBottom('users');
                        }
                    }

                    deferred.resolve();
                }).fail(function (xhr, status, error) {
                    nf.Common.handleAjaxError(xhr, status, error);
                    deferred.reject();
                });
            } else {
                deferred.resolve();
            }
        });
    };

    return {
        /**
         * Initializes the counters page.
         */
        init: function () {
            nf.Storage.init();
            
            // load the users authorities
            loadAuthorities().done(function () {
                // create the counters table
                nf.UsersTable.init();

                // load the users table
                nf.UsersTable.loadUsersTable().done(function () {
                    // finish initializing users page
                    initializeUsersPage().done(function () {
                        // configure the initial grid height
                        nf.UsersTable.resetTableSize();

                        // get the about details
                        $.ajax({
                            type: 'GET',
                            url: config.urls.controllerAbout,
                            dataType: 'json'
                        }).done(function (response) {
                            var aboutDetails = response.about;
                            var countersTitle = nf._.msg('nf-about') + ' ' + nf._.msg('nf-users-table.User');
                            // set the document title and the about title
                            document.title = countersTitle;
                            $('#users-header-text').text(countersTitle);
                        }).fail(nf.Common.handleAjaxError);
                    });
                });
            });
        }
    };
}());
