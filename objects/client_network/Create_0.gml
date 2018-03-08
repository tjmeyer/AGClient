/// @description Insert description here
// You can write your code in this editor
client = network_create_socket(network_socket_tcp);
network_set_config(network_config_connect_timeout, 5000);
global.connection_status = network_connect_raw(client, ip, port);
global.logged_in = false;
global.NETWORK = id;

lastConnectionCheckTime = get_timer();

loginMessage = "";
// constants for packet identification
// !!!MUST BE THE SAME BETWEEN CLIENT AND SERVER!!!
LOGIN_REQUEST = 1;
CONNECTION_CHECK = 2;
SECTOR_MAP = 3;