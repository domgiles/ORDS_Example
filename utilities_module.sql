-- Author : Dominic Giles
-- Date : 21/7/2016
-- File : utilities_module.sql
-- Description : Relational ORDS module definitions and test data for ORDS Demo
-- Run As : This script should be run by the app user. soe in this example


begin
  ORDS.enable_schema(
    p_enabled             => TRUE,
    p_schema              => 'SOE',
    p_url_mapping_type    => 'BASE_PATH',
    p_url_mapping_pattern => 'soe',
    p_auto_rest_auth      => FALSE
  );
  commit;
end;
/

declare
  l_module_id number;
  l_template_id number;
  l_handler_id number;
  l_parameter_id number;
begin
  l_module_id := ORDS_METADATA.ORDS_SERVICES.create_module( p_name => 'products' , p_uri_prefix => '/info/' , p_items_per_page => 25 , p_status => 'PUBLISHED' );
  l_template_id := ORDS_METADATA.ORDS_SERVICES.add_template( p_module_id => l_module_id, p_uri_template => 'products' , p_priority => 0 , p_etag_type => 'HASH' );
  l_handler_id := ORDS_METADATA.ORDS_SERVICES.add_handler( p_template_id => l_template_id,
   p_source_type => ords.source_type_collection_feed,
   p_method => 'GET' ,
   p_items_per_page => 0 ,
   p_source => 'SELECT PRODUCT_ID,' || unistr('\000a')
    || '  PRODUCT_NAME,' || unistr('\000a')
    || '  PRODUCT_DESCRIPTION,' || unistr('\000a')
    || '  CATEGORY_ID,' || unistr('\000a')
    || '  WEIGHT_CLASS,' || unistr('\000a')
    || '  WARRANTY_PERIOD,' || unistr('\000a')
    || '  SUPPLIER_ID,' || unistr('\000a')
    || '  PRODUCT_STATUS,' || unistr('\000a')
    || '  LIST_PRICE,' || unistr('\000a')
    || '  MIN_PRICE,' || unistr('\000a')
    || '  CATALOG_URL' || unistr('\000a')
    || '  FROM PRODUCT_INFORMATION');
end;
/

commit;

declare
  l_module_id number;
  l_template_id number;
  l_handler_id number;
  l_parameter_id number;
begin

  l_module_id := ORDS_METADATA.ORDS_SERVICES.create_module( p_name => 'utilities' , p_uri_prefix => '/utilities/' , p_items_per_page => 25 , p_status => 'PUBLISHED' );
  l_template_id := ORDS_METADATA.ORDS_SERVICES.add_template( p_module_id => l_module_id, p_uri_template => 'getlikes' , p_priority => 0 , p_etag_type => 'HASH' );
  l_handler_id := ORDS_METADATA.ORDS_SERVICES.add_handler( p_template_id => l_template_id, p_source_type => 'json/query;type=single' , p_method => 'GET' , p_items_per_page => 0 , p_source => 'SELECT COUNT(1) total_likes,' || unistr('\000a')
   || '  NVL(SUM(' || unistr('\000a')
   || '  CASE user_id' || unistr('\000a')
   || '    WHEN :user_id' || unistr('\000a')
   || '    THEN 1' || unistr('\000a')
   || '    ELSE 0' || unistr('\000a')
   || '  END),0) user_likes' || unistr('\000a')
   || 'FROM user_likes' || unistr('\000a')
   || 'WHERE like_table   = :table_name' || unistr('\000a')
   || 'AND   row_liked    = :column_value');
  l_parameter_id := ORDS_METADATA.ORDS_SERVICES.add_parameter( p_handler_id => l_handler_id, p_name => 'table_name' , p_bind_variable_name => 'table_name' , p_source_type => 'URI' , p_access_method => 'IN' , p_param_type => 'STRING');
  l_parameter_id := ORDS_METADATA.ORDS_SERVICES.add_parameter( p_handler_id => l_handler_id, p_name => 'column_value' , p_bind_variable_name => 'column_value' , p_source_type => 'URI' , p_access_method => 'IN' , p_param_type => 'STRING');
  l_parameter_id := ORDS_METADATA.ORDS_SERVICES.add_parameter( p_handler_id => l_handler_id, p_name => 'user_id' , p_bind_variable_name => 'user_id' , p_source_type => 'URI' , p_access_method => 'IN' , p_param_type => 'STRING');
  l_template_id := ORDS_METADATA.ORDS_SERVICES.add_template( p_module_id => l_module_id, p_uri_template => 'like' , p_priority => 0 , p_etag_type => 'HASH' );
  l_handler_id := ORDS_METADATA.ORDS_SERVICES.add_handler( p_template_id => l_template_id, p_source_type => 'plsql/block' , p_method => 'POST' , p_items_per_page => 0 , p_source => 'begin' || unistr('\000a')
   || 'declare' || unistr('\000a')
   || '  user_likes      NUMBER         := 0;' || unistr('\000a')
   || '  begin' || unistr('\000a')
   || '    select count(1) into user_likes from user_likes where like_table=:table_name and row_liked=:column_value and user_id=:user_id; ' || unistr('\000a')
   || '    if '  ||  'user_likes = 0 then' || unistr('\000a')
   || '        insert into user_likes(user_id, like_table, row_liked) values (:user_id, :table_name, :column_value);' || unistr('\000a')
   || '        commit;' || unistr('\000a')
   || '    end if;' || unistr('\000a')
   || '  end;' || unistr('\000a')
   || 'end;');
  l_parameter_id := ORDS_METADATA.ORDS_SERVICES.add_parameter( p_handler_id => l_handler_id, p_name => 'table_name' , p_bind_variable_name => 'table_name' , p_source_type => 'URI' , p_access_method => 'IN' , p_param_type => 'STRING');
  l_parameter_id := ORDS_METADATA.ORDS_SERVICES.add_parameter( p_handler_id => l_handler_id, p_name => 'column_value' , p_bind_variable_name => 'column_value' , p_source_type => 'URI' , p_access_method => 'IN' , p_param_type => 'STRING');
  l_parameter_id := ORDS_METADATA.ORDS_SERVICES.add_parameter( p_handler_id => l_handler_id, p_name => 'user_id' , p_bind_variable_name => 'user_id' , p_source_type => 'URI' , p_access_method => 'IN' , p_param_type => 'STRING');
  l_template_id := ORDS_METADATA.ORDS_SERVICES.add_template( p_module_id => l_module_id, p_uri_template => 'unlike' , p_priority => 0 , p_etag_type => 'HASH' );
  l_handler_id := ORDS_METADATA.ORDS_SERVICES.add_handler( p_template_id => l_template_id, p_source_type => 'plsql/block' , p_method => 'DELETE' , p_items_per_page => 0 , p_source => 'begin' || unistr('\000a')
   || 'declare' || unistr('\000a')
   || '  user_likes      NUMBER         := 0;' || unistr('\000a')
   || '  begin' || unistr('\000a')
   || '    select count(1) into user_likes from user_likes where like_table= :table_name and row_liked=:column_value and user_id=:user_id;' || unistr('\000a')
   || '    if '  ||  'user_likes = 1 then' || unistr('\000a')
   || '      delete user_likes where user_id = :user_id and like_table = :table_name and row_liked = :column_value;' || unistr('\000a')
   || '      commit;' || unistr('\000a')
   || '    end if;' || unistr('\000a')
   || '  end;' || unistr('\000a')
   || 'end;');
  l_parameter_id := ORDS_METADATA.ORDS_SERVICES.add_parameter( p_handler_id => l_handler_id, p_name => 'table_name' , p_bind_variable_name => 'table_name' , p_source_type => 'URI' , p_access_method => 'IN' , p_param_type => 'STRING');
  l_parameter_id := ORDS_METADATA.ORDS_SERVICES.add_parameter( p_handler_id => l_handler_id, p_name => 'column_value' , p_bind_variable_name => 'column_value' , p_source_type => 'URI' , p_access_method => 'IN' , p_param_type => 'STRING');
  l_parameter_id := ORDS_METADATA.ORDS_SERVICES.add_parameter( p_handler_id => l_handler_id, p_name => 'user_id' , p_bind_variable_name => 'user_id' , p_source_type => 'URI' , p_access_method => 'IN' , p_param_type => 'STRING');

commit;
end;
/
