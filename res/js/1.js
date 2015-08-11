$(function(){

  var _url = '1.php';
  var CKEDITOR = window.CKEDITOR || undefined;
  var _loc = location.href.split( '?' );
  $.ajaxSetup({cache:false});

  if( _loc[ 1 ] !== undefined ){

    var _param = _loc[ 1 ].split( '&' )
    , _tpl = _param[ 0 ].split( '=' )
    , url = 'tpl/' + _tpl[ 1 ] + '.tpl';

    if( _param[ 1 ] !== undefined ){
      var _parent_hash = _param[ 1 ].split( '=' )
        , _type = _param[ 2 ].split( '=' );
    }

  }

  var _func = {
    init : function(){
      _func.getList();
      _func.getView();

    }, wInit : function(){

      if( _tpl !== undefined && _type !== undefined ){
        if( _type[ 1 ] != 2 ){

          setTimeout(function(){
            $.getJSON( _url, {ac:'getInfo', hash_name:_tpl[ 1 ]}, function( res ){
              $( '#i_subj' ).val( res.ret.name );
            });
          }, 50);
        }
      }

      $( '#b_write' ).click( _wiki.write );

    }, onResizeWrite : function( callback ){

      var nHeight = $( window ).height()
        , nTopHeight = $( '.top' ).height()
        , nSubHeight = $( '#i_subj' ).height();
      var nReHeight = parseInt(nHeight - nTopHeight - nSubHeight - 350);

      callback( nReHeight );

    }, ckResize : function( nReHeight ){

      CKEDITOR.instances.t_edit.resize( '90%', nReHeight + 150 );

    }, ckInit : function( nReHeight ){
      this.setConts = function(){
      
        if( _tpl !== undefined && _type !== undefined ){
          if( _type[ 1 ] != 2 ){

            $.get( url, {}, function( res ){
              CKEDITOR.instances.t_edit.setData( res );
            });
          }
        }
      };

      this.setConts();

      CKEDITOR.replace( 't_edit', {
        language : 'ko'    
      });

      CKEDITOR.config.width = '90%';
      CKEDITOR.config.height = nReHeight;

    }, getList : function(){

      $.getJSON( _url, {ac:'getList'}, function( res ){

        var _sort_parent = []
          , _sort_child = [];

        for(var s in res.parent_info){
          res.parent_info[ s ].hash_key = s;

          _sort_parent.push( res.parent_info[ s ] );
        }

        for(var s in res.child_info){
          res.child_info[ s ].hash_key = s;
          _sort_child.push( res.child_info[ s ] );
        }

        _sort_parent.sort(function(a, b){ return a.reg_dt - b.reg_dt });
        _sort_child.sort(function(a, b){ return a.reg_dt - b.reg_dt });

        for(var k in _sort_parent){

          var key = _sort_parent[ k ].hash_key;

          for(var c in _sort_child){

            var c_key = _sort_child[ c ].hash_key
              , c_data = _sort_child[ c ];

            if(key == c_data.parent_hash){

              if(_sort_parent[ k ].child === undefined)
                _sort_parent[ k ].child = [];

              _sort_parent[ k ].child.push( c_data );
              delete _sort_child[ c ];
            
            }
          
          }
        }

        for(var a in _sort_parent){

          var _li = ''
            , _class = '';

          if( _tpl !== undefined )
            ( _tpl[ 1 ] == _sort_parent[ a ].hash_key ) ? _class = 'parent now' : _class = 'parent';
          else
            _class = 'parent';

          _li = '<li class="' + _class + '"><a href="1.html?h=' + _sort_parent[ a ].hash_key + '">' + _sort_parent[ a ].name + '</a></li>';

          $( '.list ul' ).append( _li );

          for(var b in _sort_parent[ a ].child){

          if( _tpl !== undefined )
            ( _tpl[ 1 ] == _sort_parent[ a ].child[ b ].hash_key ) ? _class = 'child now' : _class = 'child';
          else
            _class = 'child';

            _li = '<li class="' + _class +'"><a href="1.html?h=' + _sort_parent[ a ].child[ b ].hash_key + '">' 
              + _sort_parent[ a ].child[ b ].name + '</a></li>';

            $( '.list ul' ).append( _li );

          }
        }

      });

    }, getView : function(){
    
      var _loc = location.href.split( '?' );

      if( _loc[ 1 ] !== undefined ){

        var _tpl = _loc[ 1 ].split( '=' )
          , url = 'tpl/' + _tpl[ 1 ] + '.tpl';

        $( '.view' ).html( '' );

        $.get( url, {}, function( res ){

          $( '.view' ).html( res );

          $.getJSON( _url, {ac:'getInfo', hash_name:_tpl[ 1 ]}, function( res ){

            var modify = $( '<button></button>' ).text( 'modify' ).click(function(){
              _func.goModWrite( _tpl[ 1 ], res.ret.parent_hash, 1 );

            }), child_add = $( '<button></button>' ).text( 'child_add' ).click(function(){
              _func.goModWrite( '', _tpl[ 1 ], 2 );

            }), dele = $( '<button></button>' ).text( 'delete' ).click(function(){
              _func.dele( _tpl[ 1 ] );

            });

            $( '.view' ).append( $( '<div></div>' ).css( 'height', '3em' ).css( 'width', '100%' ) );
            $( '.view' ).append( modify );

            if( res.ret.parent_hash == '' )
              $( '.view' ).append( child_add );

            $( '.view' ).append( dele );
            $( '.view' ).append( $( '<div></div>' ).css( 'height', '3em' ).css( 'width', '100%' ) );
          });

          setTimeout(function(){

            hljs.configure({ tabReplace:' ' });
            hljs.initHighlighting();

          }, 20);

        });
      }

    }, goModWrite : function( hash_name, parent_hash, type ){
      $(location).attr( 'href', 'w.html?h=' + hash_name + '&ph=' + parent_hash + '&t=' + type );

    }, dele : function( hash_name ){

      $.getJSON( _url, {ac:'getExistChild', hash_name:_tpl[ 1 ]}, function( res ){

        if( res.ret ){
          alert( 'You have child wiki!' );
          return false;

        } else {
          if(confirm( 'Are you sure you want to delete this wiki?' )){
            $.post(_url, {ac:'setDelete', hash_name:hash_name}, function( res ){ 

              if( res.ret !== false ){
                alert( 'success to delete, just wait moment' );
                setTimeout(function(){
                  $(location).attr( 'href', '1.html' );
                }, 2300);
              }
            });
          }
        }
      });
    }
  };

  var _wiki = {
    write : function(){
      var hash_name = ( _tpl ) ? _tpl[ 1 ] : null
        , parent_hash = ( _parent_hash ) ? _parent_hash[ 1 ] : null 
        , type = ( _type ) ? _type[ 1 ] : null 
        , subj = $( '#i_subj' )
        , conts = CKEDITOR.instances.t_edit.getData();

      if( subj.val() == '' ){
        alert( 'please, write subject' );
        subj.focus(); 
        return false;
      }

      $.post( _url, {ac:'setWrite', hash_name:hash_name, parent_hash:parent_hash, type:type, subj:subj.val(), conts:conts}, function( res ){

        if( res.ret !== false ){
          alert( 'success to write, just wait moment' );
          setTimeout(function(){
            $(location).attr( 'href', '1.html?h=' + res.hash_name );
          }, 2300);
        }
        else{
          alert( 'fail to write' ); 
          console.log( res );
        }
      }, 'json' );
    }
  };

  if( CKEDITOR !== undefined ) _func.wInit();
  else _func.init();

  _func.onResizeWrite( _func.ckInit );

  $( window ).resize(function(){
    _func.onResizeWrite( _func.ckResize );
  });

  window.wiki = _wiki; 

});
