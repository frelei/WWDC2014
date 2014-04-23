//
//  RFLVertex.m
//  Rodrigo Freitas Leite
//
//  Created by Rodrigo Freitas Leite on 06/04/14.
//  Copyright (c) 2014 Frelei. All rights reserved.
//

#import "RFLVertex.h"


@interface RFLVertex ()


@property (nonatomic) GLuint name;
@property (nonatomic) GLsizeiptr bufferSizeBytes;
@property (nonatomic) GLsizeiptr stride;

@end

@implementation RFLVertex

// Draw all buffer or some part of buffer
+ (void)drawPreparedArraysWithMode:(GLenum)mode
                  startVertexIndex:(GLint)first
                  numberOfVertices:(GLsizei)count
{
    glDrawArrays(mode, first, count);
}

- (id)initWithAttributte:(GLsizeiptr)attribute
             verticesNum:(GLsizei)num
                   bytes:(const GLvoid *)data
                   usage:(GLenum)usage
{
    
    //if(nil != (self = [super init]))
    self = [super init];
    if (self)
    {
        _stride = attribute;
        _bufferSizeBytes = _stride * num;
        
        glGenBuffers( 1, &_name);
        glBindBuffer( GL_ARRAY_BUFFER, _name);
        glBufferData( GL_ARRAY_BUFFER, _bufferSizeBytes, data, usage);
    }
    
    return self;
}

- (void)prepareToDrawWithAttrib:(GLuint)index
            numberOfCoordinates:(GLint)count
                   attribOffset:(GLsizeiptr)offset
                   shouldEnable:(BOOL)shouldEnable
{
    glBindBuffer(GL_ARRAY_BUFFER, _name);
    if(shouldEnable)
        glEnableVertexAttribArray(index);
    
    glVertexAttribPointer( index, count, GL_FLOAT, GL_FALSE, _stride, NULL + offset);
    
    // once send the data, clear the bind
    glBindVertexArrayOES(0);
    glBindBuffer(GL_ARRAY_BUFFER,0);
}


@end
