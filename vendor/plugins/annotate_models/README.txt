  _
 /_|      _/__/_   /|/|   _/_ / _
(  |/)/)()/(//(-  /   |()(/(-(_)
________________________________

Add a comment summarizing the current schema to the
bottom of each ActiveRecord model, Test File,
Exemplar, Fixture and Factory source file:

 # == Schema Info
 # Schema version: 20081001061831
 #
 # Table name: line_item
 #
 #  id                  :integer(11)    not null, primary key
 #  quantity            :integer(11)    not null
 #  product_id          :integer(11)    not null
 #  unit_price          :float
 #  order_id            :integer(11)
 #

  class LineItem < ActiveRecord::Base
    belongs_to :product
   . . .

Note that this code will blow away the initial/final comment
block in your models if it looks like it was previously added
by annotate models, so you don't want to add additional text
to an automatically created comment block.

        * * Back up your model files before using... * *

== HOW TO USE:

To annotate all your models:

  rake db:annotate

To migrate & annotate:

  rake db:update


Options:

Annotate on the head of the file:

  rake db:annotate POSITION='top'


== LICENSE:

Author:
   Dave Thomas
   Pragmatic Programmers, LLC

This fork:
   Marcos Piccinini
   http://github.com/nofxx/annotate_models

Forked from:
   Rotuka
   http://github.com/rotuka/annotate_models

Released under the same license as Ruby. No Support. No Warranty.
