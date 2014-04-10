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



+ (void)drawPreparedArraysWithMode:(GLenum)mode
                  startVertexIndex:(GLint)first
                  numberOfVertices:(GLsizei)count
{
    glDrawArrays(mode, first, count);

}

- (id)initWithAttribStride:(GLsizeiptr)aStride
          numberOfVertices:(GLsizei)count
                     bytes:(const GLvoid *)dataPtr
                     usage:(GLenum)usage
{
    
    if(nil != (self = [super init]))
    {
        _stride = aStride;
        _bufferSizeBytes = _stride * count;
        
        //step 1
        glGenBuffers( 1, &_name);
        //step 2
        glBindBuffer( GL_ARRAY_BUFFER, _name);
        // Initialize buffer contents
        // Number of bytes to copy
        // Address of bytes to copy
        // Hint: cache in GPU memory
        glBufferData( GL_ARRAY_BUFFER, _bufferSizeBytes, dataPtr, usage);
    }
    
    return self;
}

- (void)prepareToDrawWithAttrib:(GLuint)index
            numberOfCoordinates:(GLint)count
                   attribOffset:(GLsizeiptr)offset
                   shouldEnable:(BOOL)shouldEnable
{
    // STEP 2
    glBindBuffer(GL_ARRAY_BUFFER, _name);
    
    if(shouldEnable)
    // Step 4
    glEnableVertexAttribArray(index);
    
    // Step 5
    // Identifies the attribute to use
     // number of coordinates for attribute
    // data is floating point
    // no fixed point scaling
    // total num bytes stored per vertex
    // offset from start of each vertex to
    glVertexAttribPointer( index, count, GL_FLOAT, GL_FALSE, _stride, NULL + offset);

    glBindVertexArrayOES(0);
    glBindBuffer(GL_ARRAY_BUFFER,0);
}


@end
