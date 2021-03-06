###
Children Chemistry

@namespace Atoms.Core
@class Attributes

@author Javier Jimenez Villar <javi@tapquo.com> || @soyjavi
###
"use strict"

Atoms.Core.Children =

  default: children: []

  ###
  Set the parent instance to current instance.
  @method chemistry
  ###
  chemistry: ->
    for item in @attributes.children or @constructor.default?.children or []
      @appendChild class_name, item[class_name] for class_name of item

  ###
  Set the parent instance to current instance.
  @method appendChild
  ###
  appendChild: (class_name, attributes={}) ->
    return if attributes.screen? and attributes.screen isnt Atoms.Device.screen
    child_constructor = class_name.toClassObject(Atoms)
    if child_constructor
      if @__available child_constructor
        if child_constructor.default?
          attributes = Atoms.Core.Helper.mix attributes, child_constructor.default

        attributes.parent = attributes.parent or @
        child = new child_constructor attributes
        @children.push child
        @[attributes.id] = child if attributes.id
        child
      else
        console.error "Instance #{class_name} not available in #{@constructor.type}.#{@constructor.base} ##{@constructor.name}."
    else
      console.error "Instance #{class_name} doesn't exists."

  ###
  Set the parent instance to current instance.
  @method destroyChildren
  @param  {string} [OPTIONAL] A determinate children with its UID
  ###
  destroyChildren: (uid) ->
    children = (child for child in @children) or []
    child.destroy?() for child in children when not uid or child.uid is uid

  __available: (instance) ->
    base = "#{instance.type}." + (instance.base or instance.name)
    (not @constructor.available or base in @constructor.available)
