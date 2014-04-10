//
//  KnowMeViewController.m
//  Rodrigo Freitas Leite
//
//  Created by Rodrigo Freitas Leite on 05/04/14.
//  Copyright (c) 2014 Frelei. All rights reserved.
//

#import "KnowMeViewController.h"
#import "RFLVertex.h"
#import "eu10.h"
#import "RFLVoice.h"


@interface KnowMeViewController ()

@property(nonatomic) GLKBaseEffect *baseEffect;
@property(nonatomic) RFLVertex *vertexPosition;
@property(nonatomic) RFLVertex *vertexNormal;
@property(nonatomic) RFLVertex *vertexTexture;
@property(nonatomic) RFLVoice *voice;
@property(nonatomic) GLKTextureInfo *textureInfo;
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation KnowMeViewController
{
    int counter;
}


-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationItem setTitle:@"Who I Am"];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.voice stopTalking];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    GLKView *view = (GLKView*) self.view;
    view.drawableDepthFormat = GLKViewDrawableDepthFormat24;
    view.context = [[EAGLContext alloc]  initWithAPI:kEAGLRenderingAPIOpenGLES2];
    [EAGLContext setCurrentContext:view.context];
    
    self.baseEffect = [[GLKBaseEffect alloc] init];
    self.baseEffect.useConstantColor = GL_TRUE;
    self.baseEffect.constantColor = GLKVector4Make( 1.0f, 1.0f, 1.0f, 1.0f);
    self.baseEffect.transform.modelviewMatrix = GLKMatrix4MakeTranslation(0.0f, 0.2f, -1.5);

    // background color
    glClearColor(55/255.0, 65/255.0, 64/255.0, 1.0f);

    // Create vertex buffers containing vertices to draw
    self.vertexPosition = [[RFLVertex alloc] initWithAttribStride:(3 * sizeof(GLfloat))
                                                 numberOfVertices:sizeof(eu10Verts) / (3 * sizeof(GLfloat))
                                                            bytes:eu10Verts
                                                            usage:GL_STATIC_DRAW];
    
    self.vertexTexture = [[RFLVertex alloc]  initWithAttribStride:(2 * sizeof(GLfloat))
                                                 numberOfVertices:sizeof(eu10TexCoords) / (2 * sizeof(GLfloat))
                                                            bytes:eu10TexCoords
                                                            usage:GL_STATIC_DRAW];
    
    // Load and Create Texture
    NSDictionary *options = [NSDictionary dictionaryWithObjectsAndKeys:
                             [NSNumber numberWithBool:YES],  GLKTextureLoaderOriginBottomLeft, nil];
    
    NSString * path = [[NSBundle mainBundle] pathForResource:@"eu8_tex_0" ofType:@"jpg"];
    self.textureInfo =  [GLKTextureLoader  textureWithContentsOfFile:path options:options error:NULL];
    self.baseEffect.texture2d0.enabled = GL_TRUE;
    self.baseEffect.texture2d0.name = self.textureInfo.name;
    self.baseEffect.texture2d0.target = self.textureInfo.target;
    
    //Configure Voice
    self.voice = [[RFLVoice alloc] init];
    self.textView.textAlignment = NSTextAlignmentCenter;
    self.voice.textView = self.textView;
    [self.voice speechMessage:@"Hi, i study computer science in federal university at city of Porto Alegre that its a college in south of Brazil. Above i attempt to do a 3D model of myself to you see me and know me better, beyond of computer graphics i like software engineering, complexity of algorithm and programming languages. Now i'm working at Brazilian Education Program for iOS Development and i'm developing apps to help and change people's lives."];
    
}


-(void)update
{
        GLKMatrix4 rotation = GLKMatrix4MakeRotation(GLKMathDegreesToRadians(2.0f), 0.0, 1.0, 0.0);
        self.baseEffect.transform.modelviewMatrix = GLKMatrix4Multiply(self.baseEffect.transform.modelviewMatrix, rotation);
}


-(void)glkView:(GLKView *)view drawInRect:(CGRect)rect
{
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
    glEnable(GL_BLEND);
   
    GLfloat aspectRatio = (float)((GLKView *)self.view).drawableWidth / (float)((GLKView *)self.view).drawableHeight;
    
    self.baseEffect.transform.projectionMatrix =
        GLKMatrix4MakeOrtho(
                              -1.0 * aspectRatio,
                              1.0 * aspectRatio,
                              -1.0,
                              1.0, 
                              1.0,
                              120.0);
   
    [self.vertexPosition prepareToDrawWithAttrib:GLKVertexAttribPosition
                             numberOfCoordinates:3
                                    attribOffset:0
                                    shouldEnable:YES];

    [self.vertexTexture prepareToDrawWithAttrib:GLKVertexAttribTexCoord0
                            numberOfCoordinates:2
                                   attribOffset:0
                                   shouldEnable:YES];

    [self.baseEffect prepareToDraw];
    
    // Draw triangles using vertices in the prepared vertex
    [RFLVertex drawPreparedArraysWithMode:GL_TRIANGLES
                         startVertexIndex:0
                         numberOfVertices:eu10NumVerts];
    
    glEnable(GL_DEPTH_TEST);
}



@end
