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

/* global nf, d3 */

nf.ContextMenu = (function () {

    /**
     * Returns whether the current group is not the root group.
     *
     * @param {selection} selection         The selection of currently selected components
     */
    var isNotRootGroup = function (selection) {
        return nf.Canvas.getParentGroupId() !== null && selection.empty();
    };

    /**
     * Determines whether the component in the specified selection is configurable.
     * 
     * @param {selection} selection         The selection of currently selected components
     */
    var isConfigurable = function (selection) {
        // ensure the correct number of components are selected
        if (selection.size() !== 1) {
            return false;
        }

        var isConfigurableComponent = nf.CanvasUtils.isLabel(selection) || nf.CanvasUtils.isProcessGroup(selection);
        if (!isConfigurableComponent) {
            if (nf.CanvasUtils.isProcessor(selection) || nf.CanvasUtils.isInputPort(selection) || nf.CanvasUtils.isOutputPort(selection) || nf.CanvasUtils.isRemoteProcessGroup(selection) || nf.CanvasUtils.isConnection(selection)) {
                isConfigurableComponent = nf.CanvasUtils.supportsModification(selection);
            }
        }

        return isConfigurableComponent && nf.Common.isDFM();
    };

    /**
     * Determines whether the component in the specified selection has configuration details.
     * 
     * @param {selection} selection         The selection of currently selected components
     */
    var hasDetails = function (selection) {
        // ensure the correct number of components are selected
        if (selection.size() !== 1) {
            return false;
        }

        if (nf.Common.isDFM()) {
            if (nf.CanvasUtils.isProcessor(selection) || nf.CanvasUtils.isInputPort(selection) || nf.CanvasUtils.isOutputPort(selection) || nf.CanvasUtils.isRemoteProcessGroup(selection) || nf.CanvasUtils.isConnection(selection)) {
                return !nf.CanvasUtils.supportsModification(selection);
            }
        } else {
            return nf.CanvasUtils.isProcessor(selection) || nf.CanvasUtils.isConnection(selection) || nf.CanvasUtils.isProcessGroup(selection) || nf.CanvasUtils.isInputPort(selection) || nf.CanvasUtils.isOutputPort(selection) || nf.CanvasUtils.isRemoteProcessGroup(selection);
        }

        return false;
    };

    /**
     * Determines whether the components in the specified selection are deletable.
     * 
     * @param {selection} selection         The selection of currently selected components 
     */
    var isDeletable = function (selection) {
        return nf.Common.isDFM() && nf.CanvasUtils.isDeletable(selection);
    };

    /**
     * Determines whether the components in the specified selection are runnable.
     * 
     * @param {selection} selection         The selection of currently selected components 
     */
    var isRunnable = function (selection) {
        return nf.Common.isDFM() && nf.CanvasUtils.areRunnable(selection);
    };

    /**
     * Determines whether the components in the specified selection are stoppable.
     * 
     * @param {selection} selection         The selection of currently selected components 
     */
    var isStoppable = function (selection) {
        return nf.Common.isDFM() && nf.CanvasUtils.areStoppable(selection);
    };

    /**
     * Determines whether the components in the specified selection support stats.
     * 
     * @param {selection} selection         The selection of currently selected components
     */
    var supportsStats = function (selection) {
        // ensure the correct number of components are selected
        if (selection.size() !== 1) {
            return false;
        }

        return nf.CanvasUtils.isProcessor(selection) || nf.CanvasUtils.isProcessGroup(selection) || nf.CanvasUtils.isRemoteProcessGroup(selection) || nf.CanvasUtils.isConnection(selection);
    };

    /**
     * Determines whether the components in the specified selection has usage documentation.
     * 
     * @param {selection} selection         The selection of currently selected components
     */
    var hasUsage = function (selection) {
        // ensure the correct number of components are selected
        if (selection.size() !== 1) {
            return false;
        }

        return nf.CanvasUtils.isProcessor(selection);
    };

    /**
     * Determines whether there is one component selected.
     * 
     * @param {selection} selection         The selection of currently selected components
     */
    var isNotConnection = function (selection) {
        return selection.size() === 1 && !nf.CanvasUtils.isConnection(selection);
    };

    /**
     * Determines whether the components in the specified selection are copyable.
     * 
     * @param {selection} selection         The selection of currently selected components
     */
    var isCopyable = function (selection) {
        return nf.Common.isDFM() && nf.CanvasUtils.isCopyable(selection);
    };

    /**
     * Determines whether the components in the specified selection are pastable.
     * 
     * @param {selection} selection         The selection of currently selected components
     */
    var isPastable = function (selection) {
        return nf.Common.isDFM() && nf.CanvasUtils.isPastable();
    };

    /**
     * Determines whether the specified selection is empty.
     * 
     * @param {selection} selection         The seleciton
     */
    var emptySelection = function (selection) {
        return selection.empty();
    };

    /**
     * Determines whether the componets in the specified selection support being moved to the front.
     * 
     * @param {selection} selection         The selection
     */
    var canMoveToFront = function (selection) {
        // ensure the correct number of components are selected
        if (selection.size() !== 1) {
            return false;
        }

        return nf.Common.isDFM() && nf.CanvasUtils.isConnection(selection);
    };

    /**
     * Determines whether the components in the specified selection are colorable.
     * 
     * @param {selection} selection          The selection
     */
    var isColorable = function (selection) {
        return nf.Common.isDFM() && nf.CanvasUtils.isColorable(selection);
    };

    /**
     * Determines whether the component in the specified selection is a connection.
     * 
     * @param {selection} selection         The selection
     */
    var isConnection = function (selection) {
        // ensure the correct number of components are selected
        if (selection.size() !== 1) {
            return false;
        }

        return nf.CanvasUtils.isConnection(selection);
    };

    /**
     * Determines whether the component in the specified selection could possibly have downstream components.
     * 
     * @param {selection} selection         The selection
     */
    var hasDownstream = function (selection) {
        // ensure the correct number of components are selected
        if (selection.size() !== 1) {
            return false;
        }

        return nf.CanvasUtils.isFunnel(selection) || nf.CanvasUtils.isProcessor(selection) || nf.CanvasUtils.isProcessGroup(selection) ||
                nf.CanvasUtils.isRemoteProcessGroup(selection) || nf.CanvasUtils.isInputPort(selection) ||
                (nf.CanvasUtils.isOutputPort(selection) && nf.Canvas.getParentGroupId() !== null);
    };

    /**
     * Determines whether the component in the specified selection could possibly have upstream components.
     * 
     * @param {selection} selection         The selection
     */
    var hasUpstream = function (selection) {
        // ensure the correct number of components are selected
        if (selection.size() !== 1) {
            return false;
        }

        return nf.CanvasUtils.isFunnel(selection) || nf.CanvasUtils.isProcessor(selection) || nf.CanvasUtils.isProcessGroup(selection) ||
                nf.CanvasUtils.isRemoteProcessGroup(selection) || nf.CanvasUtils.isOutputPort(selection) ||
                (nf.CanvasUtils.isInputPort(selection) && nf.Canvas.getParentGroupId() !== null);
    };

    /**
     * Determines whether the current selection is a process group.
     * 
     * @param {selection} selection
     */
    var isProcessGroup = function (selection) {
        // ensure the correct number of components are selected
        if (selection.size() !== 1) {
            return false;
        }

        return nf.CanvasUtils.isProcessGroup(selection);
    };

    /**
     * Determines whether the current selection could have provenance.
     *
     * @param {selection} selection
     */
    var canAccessProvenance = function (selection) {
        // ensure the correct number of components are selected
        if (selection.size() !== 1) {
            return false;
        }

        return !nf.CanvasUtils.isLabel(selection) && !nf.CanvasUtils.isConnection(selection) && !nf.CanvasUtils.isProcessGroup(selection)
            && !nf.CanvasUtils.isRemoteProcessGroup(selection) && nf.Common.canAccessProvenance();
    };

    /**
     * Determines whether the current selection is a remote process group.
     * 
     * @param {selection} selection         
     */
    var isRemoteProcessGroup = function (selection) {
        // ensure the correct number of components are selected
        if (selection.size() !== 1) {
            return false;
        }

        return nf.CanvasUtils.isRemoteProcessGroup(selection);
    };

    /**
     * Determines if the components in the specified selection support starting transmission.
     * 
     * @param {selection} selection
     */
    var canStartTransmission = function (selection) {
        return nf.Common.isDFM() && nf.CanvasUtils.canAllStartTransmitting(selection);
    };

    /**
     * Determines if the components in the specified selection support stopping transmission.
     * 
     * @param {selection} selection
     */
    var canStopTransmission = function (selection) {
        return nf.Common.isDFM() && nf.CanvasUtils.canAllStopTransmitting(selection);
    };
    
    /**
     * Only DFMs can empty a queue.
     * 
     * @param {selection} selection
     */
    var canEmptyQueue = function (selection) {
        return nf.Common.isDFM() && isConnection(selection);
    };
    
    /**
     * Determines if the components in the specified selection can be moved into a parent group.
     * 
     * @param {type} selection
     */
    var canMoveToParent = function (selection) {
        return !selection.empty() && nf.CanvasUtils.isDisconnected(selection) && nf.Canvas.getParentGroupId() !== null;
    };

    /**
     * Adds a menu item to the context menu.
     * 
     * {
     *      click: refresh (function),
     *      text: 'Start' (string),
     *      img: 'images/iconRun.png'
     * }
     * 
     * @param {jQuery} contextMenu The context menu
     * @param {object} item The menu item configuration
     */
    var addMenuItem = function (contextMenu, item) {
        if (typeof item.click === 'function') {
            var menuItem = $('<div class="context-menu-item"></div>').on('click', item['click']).on('contextmenu', function (evt) {
                // invoke the desired action
                item['click'](evt);

                // stop propagation and prevent default
                evt.preventDefault();
                evt.stopPropagation();
            }).on('mouseenter', function () {
                $(this).addClass('hover');
            }).on('mouseleave', function () {
                $(this).removeClass('hover');
            }).appendTo(contextMenu);

            // create the img and conditionally add the style
            var img = $('<div class="context-menu-item-img"></div>').css('background-image', 'url(' + item['img'] + ')').appendTo(menuItem);
            if (nf.Common.isDefinedAndNotNull(item['imgStyle'])) {
                img.addClass(item['imgStyle']);
            }
            
            $('<div class="context-menu-item-text"></div>').text(item['text']).appendTo(menuItem);
            $('<div class="clear"></div>').appendTo(menuItem);
        }
    };

    /**
     * Positions and shows the context menu.
     * 
     * @param {jQuery} contextMenu  The context menu
     * @param {object} options      The context menu configuration
     */
    var positionAndShow = function (contextMenu, options) {
        contextMenu.css({
            'left': options.x + 'px',
            'top': options.y + 'px'
        }).show();
    };

    /**
     * Executes the specified action with the optional selection.
     * 
     * @param {string} action
     * @param {selection} selection
     * @param {mouse event} evt
     */
    var executeAction = function (action, selection, evt) {
        // execute the action
        nf.Actions[action](selection, evt);

        // close the context menu
        nf.ContextMenu.hide();
    };

    // defines the available actions and the conditions which they apply
    var actions = [
        {condition: emptySelection, menuItem: {img: 'images/iconRefresh.png', text:nf._.msg('nf-context-menu.RefreshStatus'), action: 'reloadStatus'}},
        {condition: isNotRootGroup, menuItem: {img: 'images/iconGoTo.png', text:nf._.msg('nf-context-menu.LeaveGroup'), action: 'leaveGroup'}},
        {condition: isConfigurable, menuItem: {img: 'images/iconConfigure.png', text:nf._.msg('nf-context-menu.Configure'), action: 'showConfiguration'}},
        {condition: hasDetails, menuItem: {img: 'images/iconConfigure.png', text:nf._.msg('nf-context-menu.ViewConfiguration'), action: 'showDetails'}},
        {condition: isProcessGroup, menuItem: {img: 'images/iconGoTo.png', text:nf._.msg('nf-context-menu.EnterGroup'), action: 'enterGroup'}},
        {condition: isRunnable, menuItem: {img: 'images/iconRun.png', text:nf._.msg('nf-context-menu.Start'), action: 'start'}},
        {condition: isStoppable, menuItem: {img: 'images/iconStop.png', text:nf._.msg('nf-context-menu.Stop'), action: 'stop'}},
        {condition: isRemoteProcessGroup, menuItem: {img: 'images/iconRemotePorts.png', text:nf._.msg('nf-context-menu.RemotePorts'), action: 'remotePorts'}},
        {condition: canStartTransmission, menuItem: {img: 'images/iconTransmissionActive.png', text:nf._.msg('nf-context-menu.EnableTransmission'), action: 'enableTransmission'}},
        {condition: canStopTransmission, menuItem: {img: 'images/iconTransmissionInactive.png', text:nf._.msg('nf-context-menu.DisableTransmission'), action: 'disableTransmission'}},
        {condition: supportsStats, menuItem: {img: 'images/iconChart.png', text:nf._.msg('nf-context-menu.Stats'), action: 'showStats'}},
        {condition: canAccessProvenance, menuItem: {img: 'images/iconProvenance.png', imgStyle: 'context-menu-provenance', text:nf._.msg('nf-context-menu.DataProvenance'), action: 'openProvenance'}},
        {condition: canMoveToFront, menuItem: {img: 'images/iconToFront.png', text:nf._.msg('nf-context-menu.BringFront'), action: 'toFront'}},
        {condition: isConnection, menuItem: {img: 'images/iconGoTo.png', text:nf._.msg('nf-context-menu.GoToSource'), action: 'showSource'}},
        {condition: isConnection, menuItem: {img: 'images/iconGoTo.png', text:nf._.msg('nf-context-menu.GoToDestination'), action: 'showDestination'}},
        {condition: hasUpstream, menuItem: {img: 'images/iconSmallRelationship.png', text:nf._.msg('nf-context-menu.UpstreamConnections'), action: 'showUpstream'}},
        {condition: hasDownstream, menuItem: {img: 'images/iconSmallRelationship.png', text:nf._.msg('nf-context-menu.DownstreamConnections'), action: 'showDownstream'}},
        {condition: hasUsage, menuItem: {img: 'images/iconUsage.png', text:nf._.msg('nf-context-menu.Usage'), action: 'showUsage'}},
        {condition: isRemoteProcessGroup, menuItem: {img: 'images/iconRefresh.png', text:nf._.msg('nf-context-menu.Refresh'), action: 'refreshRemoteFlow'}},
        {condition: isRemoteProcessGroup, menuItem: {img: 'images/iconGoTo.png', text:nf._.msg('nf-context-menu.GoTo'), action: 'openUri'}},
        {condition: isColorable, menuItem: {img: 'images/iconColor.png', text:nf._.msg('nf-context-menu.ChangeColor'), action: 'fillColor'}},
        {condition: isNotConnection, menuItem: {img: 'images/iconCenterView.png', text:nf._.msg('nf-context-menu.CenterInView'), action: 'center'}},
        {condition: isCopyable, menuItem: {img: 'images/iconCopy.png', text:nf._.msg('nf-context-menu.Copy'), action: 'copy'}},
        {condition: isPastable, menuItem: {img: 'images/iconPaste.png', text:nf._.msg('nf-context-menu.Paste'), action: 'paste'}},
        {condition: canMoveToParent, menuItem: {img: 'images/iconMoveToParent.png', text:nf._.msg('nf-context-menu.MoveParentGroup'), action: 'moveIntoParent'}},
        {condition: canEmptyQueue, menuItem: {img: 'images/iconEmptyQueue.png', text:nf._.msg('nf-context-menu.EmptyQueue'), action: 'emptyQueue'}},
        {condition: isDeletable, menuItem: {img: 'images/iconDelete.png', text:nf._.msg('nf-context-menu.Delete'), action: 'delete'}}
    ];

    /**
     * Positions and shows the context menu.
     * 
     * @param {jQuery} contextMenu  The context menu
     * @param {object} options      The context menu configuration
     */
    var positionAndShow = function (contextMenu, options) {
        contextMenu.css({
            'left': options.x + 'px',
            'top': options.y + 'px'
        }).show();
    };

    return {
        init: function () {
            $('#context-menu').on('contextmenu', function(evt) {
                // stop propagation and prevent default
                evt.preventDefault();
                evt.stopPropagation();
            });
        },
        
        /**
         * Shows the context menu. 
         */
        show: function () {
            var canvasBody = $('#canvas-body').get(0);
            var contextMenu = $('#context-menu').empty();

            // get the current selection
            var selection = nf.CanvasUtils.getSelection();

            // consider each component action for the current selection
            $.each(actions, function (_, action) {
                // determine if this action is application for this selection
                if (action.condition(selection)) {
                    var menuItem = action.menuItem;

                    addMenuItem(contextMenu, {
                        img: menuItem.img,
                        imgStyle: menuItem.imgStyle, 
                        text: menuItem.text,
                        click: function (evt) {
                            executeAction(menuItem.action, selection, evt);
                        }
                    });
                }
            });

            // get the location for the context menu
            var position = d3.mouse(canvasBody);

            // show the context menu
            positionAndShow(contextMenu, {
                'x': position[0],
                'y': position[1]
            });

            // refresh the toolbar incase we've click on the canvas
            nf.CanvasToolbar.refresh();
        },
        
        /**
         * Hides the context menu.
         */
        hide: function () {
            $('#context-menu').hide();
        },
        
        /**
         * Activates the context menu for the components in the specified selection.
         * 
         * @param {selection} components    The components to enable the context menu for
         */
        activate: function (components) {
            components.on('contextmenu.selection', function () {
                // get the clicked component to update selection
                nf.ContextMenu.show();

                // stop propagation and prevent default
                d3.event.preventDefault();
                d3.event.stopPropagation();
            });
        }
    };
}());
