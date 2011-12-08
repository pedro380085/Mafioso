//
//  CreditosViewController.h
//  Mafioso
//
//  Created by Pedro Góes on 13/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "Constantes.h"
#import "RootViewController.h"

@interface CreditosViewController : UIViewController {
    IBOutlet UIImageView *imagem;
    IBOutlet UIButton *voltar;
    IBOutlet UILabel *desenvolvedor;
    IBOutlet UILabel *ajuda;
}

- (IBAction)retornarCreditosTocado:(id)sender;

@end
