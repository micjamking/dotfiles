#!/usr/bin/env node

/**
 * Get color converting library
 */ 
var c2xterm  = require('color2xterm');
var getXTerm = c2xterm.hex2xterm;

/** 
 * Get command-line arguments
 */
var args = process.argv.slice( 2 ).map( function( item ) {
  
  return item;

});

/**
 * Convert Hex color values to Xterm
 */
var convertColors = function( colors ) {

  colors.forEach( function( color ) {

    color = '#' + color;

    if (getXTerm){
    
      console.log( color + ' : ' + getXTerm( color ) );

    }

    else {
    
      console.log('Sorry, color2xterm not installed!');

    }
  
  });

}

/** Run everything!  */
convertColors(args);
