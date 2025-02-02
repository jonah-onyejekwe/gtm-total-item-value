___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "MACRO",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "Total Item Value (Price × Quantity)",
  "description": "This variable calculates the total value of items in an array by multiplying each item\u0027s price and quantity attributes.",
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "TEXT",
    "name": "itemArrayInput",
    "displayName": "Items Array Variable",
    "simpleValueType": true,
    "help": "Enter the variable that contains the array of items.",
    "valueHint": "e.g., {{dlv - ecommerce.items}}",
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      }
    ]
  },
  {
    "type": "TEXT",
    "name": "priceAttributeKey",
    "displayName": "Price Attribute Key",
    "simpleValueType": true,
    "help": "Specify the attribute key in each object that represents the item\u0027s price. The data type will be handled automatically.",
    "valueHint": "e.g., price",
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      }
    ]
  },
  {
    "type": "TEXT",
    "name": "quantityAttributeKey",
    "displayName": "Quantity Attribute Key",
    "simpleValueType": true,
    "help": "Specify the attribute key in each object that represents the item\u0027s quantity. The data type will be handled automatically.",
    "valueHint": "e.g., quantity",
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      }
    ]
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

// Import required GTM Core APIs
const getType = require('getType');
const makeNumber = require('makeNumber');
const JSON = require('JSON');
const Math = require('Math');

// Retrieve input values from the template fields
const itemArray = data.itemArrayInput;
const priceKey = data.priceAttributeKey;
const quantityKey = data.quantityAttributeKey;

// Ensure the input is an array
if (getType(itemArray) !== 'array' || itemArray.length === 0) {
  return undefined;
}

// Initialize total sum
let totalValue = 0;

// Iterate over each item in the array
itemArray.forEach(function(item) {
  // Ensure the item is an object and contains the required keys
  if (getType(item) === 'object' && item.hasOwnProperty(priceKey) && item.hasOwnProperty(quantityKey)) {
    
    // Convert values to numbers
    const price = makeNumber(item[priceKey]);
    const quantity = makeNumber(item[quantityKey]);
    
    // Ensure both price and quantity are valid numbers
    if (getType(price) === 'number' && getType(quantity) === 'number') {
      totalValue += price * quantity;
    }
  }
});

// Return the final total value
return totalValue > 0 ? totalValue : undefined;


___TESTS___

scenarios: []


___NOTES___

Created on 2/2/2025, 2:45:06 PM


