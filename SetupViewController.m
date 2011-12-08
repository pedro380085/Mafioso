//
//  SetupViewController.m
//  Mafioso
//
//  Created by Pedro Góes on 13/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SetupViewController.h"

@implementation SetupViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [bloqueio setAlpha:1.0];
    [bloqueioSecundario setAlpha:1.0];
    [UIView animateWithDuration:ANIMACAO_TRANSICAO animations:^{
        [bloqueio setAlpha:0.0];
    }];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)adicinarString:(NSString *)string emArray:(NSMutableArray *)array nVezes:(NSInteger)n {
    for (int j=0; j<n; j++) {
        [array addObject:string];
    }
}

- (IBAction)viewTocada:(id)sender {
    // Ajustar valores do for de acordo com o número e as tag dos personagens;
    for (int i=100; i<101+QUANT_PERSONAGENS; i++) {
        UITextField *campo = (UITextField *)[self.view viewWithTag:i];
        [campo resignFirstResponder];
    }
}

- (IBAction)confirmarJogadoresTocado:(id)sender {
    NSInteger numJogadores = [[jogadores text] integerValue];
    
    if (numJogadores < 5) {
        [[[[UIAlertView alloc] initWithTitle:@"Alerta" message:@"O número mínimo de jogadores é 5 pessoas!" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil] autorelease] show];
        
        return;
    }

     
    UITextField *campo = (UITextField *)[self.view viewWithTag:VITIMA];
    [campo setText:[NSString stringWithFormat:@"%d", (numJogadores - (QUANT_PERSONAGENS-1))]];
    
    
    [UIView animateWithDuration:ANIMACAO_TRANSICAO animations:^{
        [bloqueioSecundario setFrame:CGRectMake(0.0, 480.0, bloqueioSecundario.frame.size.width, bloqueioSecundario.frame.size.height)];
    }];
}


- (IBAction)iniciarJogoTocado:(id)sender {
    
    NSMutableArray *ordem = [NSMutableArray array];
    
    for (int i=101; i<101+QUANT_PERSONAGENS; i++) {
        UITextField *campo = (UITextField *)[self.view viewWithTag:i];
        NSInteger numPersonagens = [[campo text] integerValue];
        
        if (numPersonagens < 0) {
            [[[[UIAlertView alloc] initWithTitle:@"Alerta" message:@"Dãããããããããã, não podem existir jogadores negativos!" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil] autorelease] show];
            
            return;
        }
        
        
        switch (i) {
            case DEUS:
                [self adicinarString:@"Deus" emArray:ordem nVezes:numPersonagens];
                break;
            case ASSASSINO:
                [self adicinarString:@"Assassino" emArray:ordem nVezes:numPersonagens];
                break;
            case SERIAL:
                [self adicinarString:@"Serial Killer" emArray:ordem nVezes:numPersonagens];
                break;
            case ANJO:
                [self adicinarString:@"Anjo" emArray:ordem nVezes:numPersonagens];
                break;
            case DETETIVE:
                [self adicinarString:@"Detetive" emArray:ordem nVezes:numPersonagens];
                break;
            case VITIMA:
                [self adicinarString:@"Vitima" emArray:ordem nVezes:numPersonagens];
                break;
            default:
                break;
        }
    }
    
    [UIView animateWithDuration:ANIMACAO_TRANSICAO animations:^{
        bloqueio.alpha = 1.0;
    } completion:^(BOOL fim) {
        JogadorViewController *jvc = [[JogadorViewController alloc] initWithNibName:@"JogadorViewController" bundle:nil];
        jvc.ordem = ordem;
        [self.navigationController pushViewController:jvc animated:NO];
        [jvc release];
    }];
}

#pragma - Text Field Delegate

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    [UIView animateWithDuration:ANIMACAO_TRANSICAO*0.4 animations:^{
        [self.view setFrame:CGRectMake(0.0, -162.0, self.view.frame.size.width, self.view.frame.size.height)];
    }];
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    [UIView animateWithDuration:ANIMACAO_TRANSICAO*0.4 animations:^{
        [self.view setFrame:CGRectMake(0.0, 0.0, self.view.frame.size.width, self.view.frame.size.height)];
    }];
}

@end
