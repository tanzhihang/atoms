###
@TODO

@namespace Atoms.Atom
@class Li

@author Javier Jimenez Villar <javi@tapquo.com> || @soyjavi
###
"use strict"

class Atoms.Atom.Li extends Atoms.Core.Class.Atom

  template: """
    <li class="{{style}}">{{text}}</li>"""

  events: ["click"]