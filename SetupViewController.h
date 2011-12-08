//
//  SetupViewController.h
//  Mafioso
//
//  Created by Pedro Góes on 13/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constantes.h"
#import "JogadorViewController.h"

@interface SetupViewController : UIViewController <UITextFieldDelegate> {
    IBOutlet UIView *bloqueio;
    IBOutlet UIView *bloqueioSecundario;
    IBOutlet UITextField *jogadores;
}

- (void)adicinarString:(NSString *)string emArray:(NSMutableArray *)array nVezes:(NSInteger)n;
- (IBAction)viewTocada:(id)sender;
- (IBAction)confirmarJogadoresTocado:(id)sender;
- (IBAction)iniciarJogoTocado:(id)sender;

@end
