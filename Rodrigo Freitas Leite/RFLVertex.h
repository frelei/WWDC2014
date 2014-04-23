//
//  RFLVertex.h
//  Rodrigo Freitas Leite
//
//  Created by Rodrigo Freitas Leite on 06/04/14.
//  Copyright (c) 2014 Frelei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GLKit/GLKit.h>


// encapsulate OpenGL ES
@interface RFLVertex : NSObject

+ (void)drawPreparedArraysWithMode:(GLenum)mode
                  startVertexIndex:(GLint)first
                  numberOfVertices:(GLsizei)count;

- (id)initWithAttributte:(GLsizeiptr)attibute
             verticesNum:(GLsizei)num
                     bytes:(const GLvoid *)data
                     usage:(GLenum)usage;

- (void)prepareToDrawWithAttrib:(GLuint)index
            numberOfCoordinates:(GLint)count
                   attribOffset:(GLsizeiptr)offset
                   shouldEnable:(BOOL)shouldEnable;

@end
