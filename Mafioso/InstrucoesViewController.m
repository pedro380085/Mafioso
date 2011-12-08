//
//  InstrucoesViewController.m
//  Mafioso
//
//  Created by Pedro Góes on 13/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "InstrucoesViewController.h"

@implementation InstrucoesViewController

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

    [UIView animateWithDuration:ANIMACAO_TRANSICAO animations:^{
        [imagem setFrame:CGRectMake(0.0, -420.0, 320.0, 420.0)];
    } completion:^(BOOL fim) {
        [web loadRequest:[NSURLRequest requestWithURL:[[NSBundle mainBundle] URLForResource:@"Wiki_Cidade_Dorme" withExtension:@"html"]]];
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

- (IBAction)retornarInstrucoesTocado:(id)sender {
    [web setHidden:YES];
    [UIView animateWithDuration:ANIMACAO_TRANSICAO animations:^{
        [imagem setFrame:CGRectMake(0.0, -234.0, 320.0, 420.0)];
    } completion:^(BOOL fim) {
        RootViewController *controller = (RootViewController *)[self.navigationController.viewControllers objectAtIndex:0];
        [self.navigationController popToRootViewControllerAnimated:NO];
        [controller inserirRootViewController];
    }];
}

@end
