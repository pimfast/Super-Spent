{
  "resourceType": "GMObject",
  "resourceVersion": "1.0",
  "name": "obj_hitbox",
  "eventList": [
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","collisionObjectId":null,"eventNum":0,"eventType":2,"isDnD":false,},
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","collisionObjectId":null,"eventNum":0,"eventType":0,"isDnD":false,},
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","collisionObjectId":null,"eventNum":0,"eventType":3,"isDnD":false,},
  ],
  "managed": true,
  "overriddenProperties": [],
  "parent": {
    "name": "misc",
    "path": "folders/Objects/misc.yy",
  },
  "parentObjectId": null,
  "persistent": false,
  "physicsAngularDamping": 0.1,
  "physicsDensity": 0.5,
  "physicsFriction": 0.2,
  "physicsGroup": 1,
  "physicsKinematic": false,
  "physicsLinearDamping": 0.1,
  "physicsObject": false,
  "physicsRestitution": 0.1,
  "physicsSensor": false,
  "physicsShape": 1,
  "physicsShapePoints": [],
  "physicsStartAwake": true,
  "properties": [
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"dir","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":true,"rangeMax":1.0,"rangeMin":-1.0,"value":"-1","varType":0,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"damagesPlayer","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"True","varType":3,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"damagesEnemies","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"True","varType":3,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"vknockback","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"-8","varType":0,},
  ],
  "solid": false,
  "spriteId": {
    "name": "spr_hitbox",
    "path": "sprites/spr_hitbox/spr_hitbox.yy",
  },
  "spriteMaskId": null,
  "visible": false,
}