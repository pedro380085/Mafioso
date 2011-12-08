//
//  JogadorViewController.h
//  Mafioso
//
//  Created by Pedro Góes on 13/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constantes.h"
#import "FimViewController.h"

@interface JogadorViewController : UIViewController {
    IBOutlet UIView *bloqueio;
    IBOutlet UIImageView *imagem;
    IBOutlet UILabel *personagem;
    IBOutlet UIButton *alternador;
    
    NSMutableArray *ordem;
    NSMutableArray *nomes;
}

@property (nonatomic, retain) NSMutableArray *ordem;

- (IBAction)alternarView:(id)sender;

@end
