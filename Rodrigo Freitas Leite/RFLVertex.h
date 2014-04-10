//
//  RFLVertex.h
//  Rodrigo Freitas Leite
//
//  Created by Rodrigo Freitas Leite on 06/04/14.
//  Copyright (c) 2014 Frelei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GLKit/GLKit.h>

@interface RFLVertex : NSObject

+ (void)drawPreparedArraysWithMode:(GLenum)mode
                  startVertexIndex:(GLint)first
                  numberOfVertices:(GLsizei)count;

- (id)initWithAttribStride:(GLsizeiptr)stride
          numberOfVertices:(GLsizei)count
                     bytes:(const GLvoid *)dataPtr
                     usage:(GLenum)usage;

- (void)prepareToDrawWithAttrib:(GLuint)index
            numberOfCoordinates:(GLint)count
                   attribOffset:(GLsizeiptr)offset
                   shouldEnable:(BOOL)shouldEnable;

@end
