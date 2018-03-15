/// @description Builds packet to request system information from the Server
var network = global.NETWORK;

if(global.connection_status >= 0)
{
	loadingText = "Queueing Request";
	// generate packet buffer
	var send_buffer = buffer_create(256, buffer_grow, 1);
	buffer_seek(send_buffer, buffer_seek_start, 0);
	
	// create information map to fill the buffer with later
	var buffer_map = ds_map_create();
	ds_map_add(buffer_map, "type", network.SYSTEM_REQUEST); // type of message to the server for sorting
	ds_map_add(buffer_map, "id", global.current_system_db_id); // db id of requested system.
	// attach the map as json to the send_buffer
	buffer_write(send_buffer, buffer_string, json_encode(buffer_map));
	network_send_raw(network.client, send_buffer, buffer_tell(send_buffer));
	loadingText = "Waiting on Server Response";
}