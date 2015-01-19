<?php
define('TPL_DIRECTORY', 'tpl');
define('CONFIG_PATH', 'config/info.config.php');

function _setDelete()//{{{
{
  require_once CONFIG_PATH;

  $hash_name = $_POST[ 'hash_name' ];

  $tpl_path = "tpl/$hash_name".".tpl";

  unset($info[ $hash_name ]);

  $sInfo = _make('$info', $info);

  $result_config = file_put_contents(CONFIG_PATH, '<?php'."\n".$sInfo); 

  if($result_config) 
    $result_unlink = unlink($tpl_path);

  _echo_json(array('ret'=>$result_unlink));
}//}}}

function _getList()//{{{
{
  require_once CONFIG_PATH;

  $parent_info = array();
  $child_info = array();

  foreach($info as $key=>$value)
  {
    if($value[ 'parent_hash' ] == '')
      $parent_info[ $key ] = $value;
    else
      $child_info[ $key ] = $value;
  
  }

  _echo_json(array('parent_info'=>$parent_info, 'child_info'=>$child_info));
}//}}}

function _setWrite()//{{{
{
  $hash_name = $_POST[ 'hash_name' ];
  $parent_hash = $_POST[ 'parent_hash' ];
  $type = $_POST[ 'type' ];
  $subj = $_POST[ 'subj' ];
  $conts = $_POST[ 'conts' ];

  if(empty($hash_name) || $hash_name == '' || (int)$type == 2)
  {
    $hash_name = _makeRanFileName( 10 );
    $tpl_path = "tpl/$hash_name".".tpl";

    while(file_exists($tpl_path))
      $hash_name = _makeRanFileName( 10 );
  }

  $tpl_path = "tpl/$hash_name".".tpl";

  $aInfo = array('name'=>$subj, 'parent_hash'=>$parent_hash, 'reg_dt'=>date( 'YmdHis' ));

  if(file_exists(CONFIG_PATH))
  {
    require_once CONFIG_PATH;
    $aInfoAll = $info;
  }

  $aInfoAll[ $hash_name ] = $aInfo;
  $sInfo = _make('$info', $aInfoAll);

  $result_tpl = file_put_contents($tpl_path, $conts);

  if($result_tpl)
  {
    @chmod($tpl_path, 0777);

    $result_config = file_put_contents(CONFIG_PATH, '<?php'."\n".$sInfo); 

    if($result_config)
      _echo_json(array('hash_name'=>$hash_name, 'ret'=>$result_tpl.' | '.$result_config));
  }

  _echo_json(array('hash_name'=>$hash_name, 'ret'=>false));
}//}}}

function _getInfo()//{{{
{
  $hash_name = $_GET[ 'hash_name' ];

  require_once CONFIG_PATH;

  _echo_json(array('hash_name'=>$hash_name, 'ret'=>$info[ $hash_name ]));
}//}}}

function _getExistChild()//{{{
{
  $hash_name = $_GET[ 'hash_name' ];

  require_once CONFIG_PATH;

  foreach($info as $value)
  {
    if($value[ 'parent_hash' ] == $hash_name)
      $exists_child = true;
    else
      $exists_child = false;
  }

  _echo_json(array('ret'=>$exists_child));
}//}}}

function _echo_json($json_array)//{{{
{
  ob_clean();
  echo json_encode($json_array);
  die;
}//}}}

function _make($sVarName, $mVarValue)//{{{
{
  $aPhpCode = array();

  if (is_object($mVarValue))
  {
    foreach ($mVarValue as $key => $mCurVar)
    {
      $aPhpCode[] = _make($sVarName.'->{\''.$key.'\'}', $mCurVar);
    }
  }
  else if (is_array($mVarValue))
  {
    foreach ($mVarValue as $key => $mCurVar)
    {
      $aPhpCode[] = _make($sVarName.'[\''.$key.'\']', $mCurVar);
    }
  }
  else
  {
    if (is_string($mVarValue))
      $aPhpCode[] = $sVarName.'=\''.str_replace('\'', '\\\'', $mVarValue).'\';';
    else
      $aPhpCode[] = $sVarName.'='.$mVarValue.';';
  }

  return implode("\n", $aPhpCode);
}//}}}

function _makeRanFileName($sLen)//{{{
{
  $sRanAll = array_merge(range(0, 9), range('a', 'z'));
  $sRanStr = '';

  for($i = 0, $j = $sLen; $i<$j;$i++)
  {
    $sRanStr .= $sRanAll[rand(0, $sLen)];
  }

  return $sRanStr;
}//}}}

$action = $_REQUEST[ 'ac' ];

switch(strtolower($action))
{
  case "getlist" : 
    _getList();
    break;
  case "getinfo" : 
    _getInfo();
    break;
  case "getexistchild" : 
    _getExistChild();
    break;
  case "setwrite" : 
    _setWrite();
    break;
  case "setdelete" : 
    _setDelete();
    break;
}
