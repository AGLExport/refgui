/*
 * Copyright (c) 2020,2021 Panasonic Corporation
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

import QtQuick 6.5
import Qt5Compat.GraphicalEffects
import QtQuick.Shapes 6.5


Item{
    id: menuRoot

    Connections{
        target: rootItem
        function onTransNormalToAdas() {
            menuMain.startAnimationNormalToAdas()
            menuContents.startAnimationNormalToAdas()
            menuShade.startAnimationNormalToAdas()
        }

        function onTransAdasToMap() {
            /**/
        }

        function onTransMapToNormal() {
            menuMain.startAnimationMapToNormal()
            menuContents.startAnimationMapToNormal()
            menuShade.startAnimationMapToNormal()
        }

        function onKeyPressed_Up() {
            if(menu.state === "open"){
                menuMain.incrementIndex()
            }
        }

        function onKeyPressed_Down() {
            if(menu.state === "open"){
                menuMain.decrementIndex()
            }
        }

        function onKeyPressed_Left() {
            if(menu.state === "close"){
                menuContents.decrementIndex()
            }
        }

        function onKeyPressed_Right() {
            if(menu.state === "close"){
                menuContents.incrementIndex()
            }
        }

        function onKeyPressed_Enter() {
            if(menu.state === "close"){
                menuContents.enter()
            }else if(menu.state === "open"){
                menuContents.close()
                menuMain.close()
                menu.state = "close"
            }
        }

        function onKeyPressed_Menu() {
            if(menu.state === "close"){
                menuContents.open()
                menuMain.open()
                menu.state = "open"
            }
        }
    }

    Item{
        id: menu

        property var mode: "normal" /* Normal or Adas */
        property var state: "open" /* open or close  */

        MenuContents {
            id: menuContents
        }

        /************************************************menu_area****************************************************/
        MenuMain {
            id: menuMain
        }

        MenuShade {
            id: menuShade
        }
    }




}
