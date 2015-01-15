<?php
define('TPL_DIRECTORY', 'tpl');
define('CONFIG_PATH', 'config/info.config.php');

function _getList()//{{{
{
  require_once CONFIG_PATH;

  _echo_json(array('ret'=>$info));
}//}}}
function _setWrite()//{{{
{
  $hash_name = $_POST[ 'hash_name' ];
  $parent_hash = $_POST[ 'parent_hash' ];
  $type = $_POST[ 'type' ];
  $subj = $_POST[ 'subj' ];
  $conts = $_POST[ 'conts' ];

  if(empty($hash_name) || $hash_name == '' || (int)$type == 2)
    $hash_name = _makeRanFileName( 10 );

  $tpl_path = "tpl/$hash_name".".tpl";

  $aInfo = array('name'=>$subj, 'parent_hash'=>$parent_hash, 'reg_dt'=>date( 'YmdHis' ));

  if(file_exists(CONFIG_PATH))
  {
    require_once CONFIG_PATH;
    $aInfoAll = $info;
  }

  $aInfoAll[ $hash_name ] = $aInfo;
  $sInfo = _make('$info', $aInfoAll);

  $result_config = file_put_contents(CONFIG_PATH, '<?php'."\n".$sInfo); 

  if($result_config)
  {
    @chmod(CONFIG_PATH, 0777);
    $result_tpl = file_put_contents($tpl_path, $conts);
    @chmod($tpl_path, 0777);

    if($result_tpl)
      _echo_json(array('hash_name'=>$hash_name, 'ret'=>$result_tpl));
  }

  _echo_json(array('hash_name'=>$hash_name, 'ret'=>false));
}//}}}
function _getInfo()//{{{
{
  $hash_name = $_GET[ 'hash_name' ];

  require_once CONFIG_PATH;

  _echo_json(array('hash_name'=>$hash_name, 'ret'=>$info[ $hash_name ]));
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
  case "setwrite" : 
    _setWrite();
    break;
}
