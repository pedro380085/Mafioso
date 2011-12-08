//
//  CreditosViewController.m
//  Mafioso
//
//  Created by Pedro Góes on 13/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CreditosViewController.h"

@implementation CreditosViewController

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
    [imagem setFrame:CGRectMake(0.0, -234.0, 320.0, 420.0)];
    [voltar setAlpha:0.0];
    [UIView animateWithDuration:ANIMACAO_TRANSICAO animations:^{
        [imagem setFrame:CGRectMake(0.0, 40.0, 320.0, 420.0)];
    } completion:^(BOOL fim) {
        [voltar setAlpha:1.0];
        [ajuda setAlpha:1.0];
        [desenvolvedor setAlpha:1.0];
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

- (IBAction)retornarCreditosTocado:(id)sender {
    [voltar setAlpha:0.0];
    [ajuda setAlpha:0.0];
    [desenvolvedor setAlpha:0.0];
    [UIView animateWithDuration:ANIMACAO_TRANSICAO*1.5 animations:^{
        [imagem setFrame:CGRectMake(0.0, -234.0, 320.0, 420.0)];
    } completion:^(BOOL fim) {
        RootViewController *controller = (RootViewController *)[self.navigationController.viewControllers objectAtIndex:0];
        [self.navigationController popToRootViewControllerAnimated:NO];
        [controller inserirRootViewController];
    }];
}

@end
