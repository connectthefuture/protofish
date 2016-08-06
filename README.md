# protofish
Object and lambda system for [Fish shell][fish] 2.3+.

## Objects
protofish provides a simple, but flexible object system for those scripts where lists simply aren't enough to hold structured data.

Creating a new object with protofish is super simple with the `object` function:

```fish
> set my_object (object)
```

As you might expect, we can now get and set properties, or _slots_, in the object using some provided functions:

```fish
object-set $my_object my_slot "some value"
object-get $my_object my_slot
some value
object-contains $my_object bad_slot; or echo false
# false
object-unset $my_object my_slot
object-get $my_object my_slot
# (nothing)
```

You can also iterate over both slots and values of an object:

```fish
for slot in (object-slots $my_object)
  echo "slot: $slot"
end
for value in (object-values $my_object)
  echo "value: $value"
end
```

It should be noted that object slots are full variables in their own right, and can store any type of values a variable can. Like variables, object slots are actually lists:

```fish
object-set $my_object colors black white blue
object-get $my_object colors[3]
# blue
object-set $my_object colors[3] green
object-get $my_object colors
# black white green
```

## Inheritance
protofish provides a prototype-based inheritance system for objects, instead of the more formal class-based approach. To extend an object, pass in the parent in an `object` call:

```fish
set parent (object)
set child (object $parent)
test (object-get $child prototype) = $parent
# true
```

Multiple inheritance is also allowed. A new object will inherit from every object argument passed to the `object` function. Multiple inheritance can be dangerous in some languages, but is completely safe and deterministic in protofish. When two or more parent objects share a slot with the same name, priority is always given in inheritance order specified on the initial `object` function call; priority is greatest with the first argument, and least priority given to the last argument.

To ensure some level of sanity, you cannot change or unset values of a parent object via a child object; Inheritance only provides read access to inherited slots.

## How does it work‽
If you really must know, protofish uses global variable allocation to store object references, slot slots, and slot values. You can instantly see something _fish_y going on (I apologize for the pun) if you inspect a new object on the command line:

```fish
set fishy_object (object)
echo $fishy_object
# __object_15952
object-set $fishy_object foo bar
echo $$fishy_object
# foo
object-slot% $fishy_object foo
# __object_15952_foo
```

A lot of protofish's lookup logic is done by the `object-slot%` function, which recursively searches the object inheritance tree for the global variable name that corresponds to a given object slot.

## Inspiration
- Prototypal slot system inspired by [protobj] for Scheme.

## License
[MIT][mit] © [Stephen Coakley][author] et [al][contributors]


[author]: https://github.com/coderstephen
[contributors]: https://github.com/oh-my-fish/plugin-fasd/graphs/contributors
[fish]: http://fishshell.com
[mit]: http://opensource.org/licenses/MIT
[omf]: https://www.github.com/oh-my-fish/oh-my-fish
[protobj]: http://www.neilvandyke.org/racket/protobj
