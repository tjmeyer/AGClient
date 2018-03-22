{
    "id": "9539404c-bae2-4ab8-a5e4-487ee742df95",
    "modelName": "GMObject",
    "mvc": "1.0",
    "name": "menu_gm",
    "eventList": [
        {
            "id": "568f75fc-133d-4a75-a6f7-39e0f9b6dcac",
            "modelName": "GMEvent",
            "mvc": "1.0",
            "IsDnD": false,
            "collisionObjectId": "00000000-0000-0000-0000-000000000000",
            "enumb": 64,
            "eventtype": 8,
            "m_owner": "9539404c-bae2-4ab8-a5e4-487ee742df95"
        },
        {
            "id": "9b218166-09e6-43c9-bc73-bb5aa0168398",
            "modelName": "GMEvent",
            "mvc": "1.0",
            "IsDnD": false,
            "collisionObjectId": "00000000-0000-0000-0000-000000000000",
            "enumb": 0,
            "eventtype": 3,
            "m_owner": "9539404c-bae2-4ab8-a5e4-487ee742df95"
        },
        {
            "id": "5e1be38c-3cab-4ac4-95b0-c2e42891c75a",
            "modelName": "GMEvent",
            "mvc": "1.0",
            "IsDnD": false,
            "collisionObjectId": "00000000-0000-0000-0000-000000000000",
            "enumb": 0,
            "eventtype": 0,
            "m_owner": "9539404c-bae2-4ab8-a5e4-487ee742df95"
        }
    ],
    "maskSpriteId": "00000000-0000-0000-0000-000000000000",
    "overriddenProperties": null,
    "parentObjectId": "00000000-0000-0000-0000-000000000000",
    "persistent": false,
    "physicsAngularDamping": 0.1,
    "physicsDensity": 0.5,
    "physicsFriction": 0.2,
    "physicsGroup": 0,
    "physicsKinematic": false,
    "physicsLinearDamping": 0.1,
    "physicsObject": false,
    "physicsRestitution": 0.1,
    "physicsSensor": false,
    "physicsShape": 1,
    "physicsShapePoints": null,
    "physicsStartAwake": true,
    "properties": [
        {
            "id": "14ac482d-3853-4773-b1d2-3881897f0ecb",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "make_color_rgb(50,50,50)",
            "varName": "default_bg_color",
            "varType": 4
        },
        {
            "id": "893b6868-8b0e-4a3d-8196-6b58d0f6e253",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "make_color_rgb(50,50,50)",
            "varName": "bg_color",
            "varType": 4
        },
        {
            "id": "4700fde9-0cff-456e-a7a4-238d2429fb2f",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "1",
            "varName": "default_bg_alpha",
            "varType": 0
        },
        {
            "id": "23d91ffd-e885-419a-936e-34317995b951",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": ".8",
            "varName": "bg_alpha",
            "varType": 0
        },
        {
            "id": "8da81294-7b16-487c-8fd4-2aee074c7be7",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "0",
            "varName": "menu_top",
            "varType": 0
        },
        {
            "id": "4d57737f-73c8-46c8-ad6d-ad0ea1cbb44a",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "display_get_gui_width() - 70",
            "varName": "menu_left",
            "varType": 4
        },
        {
            "id": "93f7739b-916e-49b6-a0c4-036e3d427d09",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "display_get_gui_width()",
            "varName": "menu_right",
            "varType": 4
        },
        {
            "id": "b05b94dc-aefa-4304-b7d0-3c4396cea9b7",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "display_get_gui_height()",
            "varName": "menu_bottom",
            "varType": 4
        },
        {
            "id": "1b27b3ba-b708-4748-9d8b-100a8c4c1f94",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "3",
            "varName": "drag_buffer",
            "varType": 0
        },
        {
            "id": "fc2ae65e-a3f9-4c34-aa6c-634c1b46e156",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "0",
            "varName": "lock_btn",
            "varType": 0
        },
        {
            "id": "7b157df2-1630-4c66-bbe8-2c866bcedab4",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "30",
            "varName": "menu_min",
            "varType": 0
        },
        {
            "id": "ec3f6982-305f-42c0-ad1a-c9e383150fc4",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "150",
            "varName": "menu_max",
            "varType": 0
        },
        {
            "id": "35b4f39e-f656-4913-817a-232fb89362c1",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "-1",
            "varName": "button_list",
            "varType": 0
        }
    ],
    "solid": false,
    "spriteId": "00000000-0000-0000-0000-000000000000",
    "visible": true
}