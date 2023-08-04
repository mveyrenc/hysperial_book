# Content clock kins data

## struct amount

* qty: number
* range:
    * qty_min: number
    * qty_max: number
* unit: string, such as serving, pancakes, grams etc.
* size: string, such as small, medium, large, etc.
* variations: array of
    * qty: number
    * range:
        * qty_min: number
        * qty_max: number
    * unit: string, such as serving, pancakes, grams etc.
    * size: string, such as small, medium, large, etc.

3 eggs:
```json
{ "qty": 3 }
```

3 small apples:
```json
{ "qty": 3, "size": "small" }
```

```json
{ "qty": 2, "unit": "cups" }
```

```json
{ "qty": 2, "unit": "cans", "size": "small" }
```

3 cans (250 ml each) / 750 ml:
```json
{ "qty": 3, "unit": "can", "size": { "qty": 250, "unit": "ml" } }
```

## yield

Amount of finished product that a recipe will produce.

* quantity: [amount](#struct-amount)

## division_summary

Summary of all the divisions of the recipe.

## division

Subpart of the content

* part_type: main, variation
  * main: main division
  * variations: variations of main division

## equipment

## ingredients_summary

Summary of all the ingredients of the recipe.

* processed_ingredients: array of [ingredients](#ingredients)
* additional_ingredients: array of [ingredients](#ingredients)
* allergens_detected: array of allergens

## ingredients

A list for ingredients.

* ingredients: array of [ingredient](#ingredient)

## ingredient

* quantity: [amount](#struct-amount)
* name: string
* importance: main, required or optional
* preparation: string, such as diced, chopped, sliced, grated, minced, etc.
* notes: string
* shopping_instructions: string
* alternative_ingredients: array of ingredients without the array of alternatives

## supplies

A supply consumed when performing instructions or a direction.

* array of:
  * item
  * quantity: [amount](#struct-amount)

## tools

An object used (but not consumed) when performing instructions or a direction.

* array of:
  * item
  * quantity: [amount](#struct-amount)

## how_to_section

* supplies: [supplies](#supplies)
* ingredients: [ingredients](#ingredients)
* tools: [tools](#tools)
* times: [times](#times)
* step: array of [steps](#step)

## step

* direction: [direction](#direction)
* tip: string

## direction

* supplies
* tools
* times
* ingredients
* after_media
* before_media
* during_media
* text

## times

* overall time:
  * duration: number
  * range:
      * duration_min: number
      * duration_max: number
* times: array of
  * kind: string, such as preparation, rising, marinating, cooking, cooling, standing, etc.
  * duration: duration

## nutrition

https://schema.org/NutritionInformation

* calories
* carbohydrate_content
* cholesterol_content
* fat_content
* fiber_content
* protein_content
* saturated_fat_content
* serving_size
* sodium_content
* sugar_content
* trans_fat_content
* unsaturated_fat_content

## notes


## comment


## tips


## variations


## left_over_preservation_instructions


## suggested_accompaniments

