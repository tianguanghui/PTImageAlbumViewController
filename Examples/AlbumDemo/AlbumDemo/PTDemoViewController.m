//
// Copyright (C) 2012 Ali Servet Donmez. All rights reserved.
//
// This file is part of PTImageAlbumViewController.
// modify it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// PTImageAlbumViewController is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with PTImageAlbumViewController. If not, see <http://www.gnu.org/licenses/>.
// PTImageAlbumViewController is free software: you can redistribute it and/or
//

#import "PTDemoViewController.h"

@interface PTDemoViewController ()

@property (nonatomic, readonly) NSArray *exampleData;

@end

#define kPTDemoSourceKey        @"source"
#define kPTDemoSizeKey          @"size"
#define kPTDemoThumbnailKey     @"thumbnail"

@implementation PTDemoViewController

@synthesize exampleData = _exampleData;

- (NSArray *)exampleData
{
    if (_exampleData == nil) {
        _exampleData = [NSArray arrayWithObjects:

                        [NSDictionary dictionaryWithObjectsAndKeys:
                         @"http://farm8.staticflickr.com/7053/6885649635_7d29d75a31_b.jpg", kPTDemoSourceKey,
                         [NSValue valueWithCGSize:CGSizeMake(1024.0, 768.0)], kPTDemoSizeKey,
                         @"http://farm8.staticflickr.com/7053/6885649635_7d29d75a31_t.jpg", kPTDemoThumbnailKey,
                         nil],

                        [NSDictionary dictionaryWithObjectsAndKeys:
                         @"http://farm8.staticflickr.com/7052/6859587887_2f2df80989_b.jpg", kPTDemoSourceKey,
                         [NSValue valueWithCGSize:CGSizeMake(1024.0, 683.0)], kPTDemoSizeKey,
                         @"http://farm8.staticflickr.com/7052/6859587887_2f2df80989_t.jpg", kPTDemoThumbnailKey,
                         nil],
                        
                        [NSDictionary dictionaryWithObjectsAndKeys:
                         @"http://farm1.staticflickr.com/188/417924629_6832e79c98_z.jpg", kPTDemoSourceKey,
                         [NSValue valueWithCGSize:CGSizeMake(500.0, 500.0)], kPTDemoSizeKey,
                         @"http://farm1.staticflickr.com/188/417924629_6832e79c98_t.jpg", kPTDemoThumbnailKey,
                         nil],
                        
                        [NSDictionary dictionaryWithObjectsAndKeys:
                         @"http://farm4.staticflickr.com/3338/3274183756_10411ace99_b.jpg", kPTDemoSourceKey,
                         [NSValue valueWithCGSize:CGSizeMake(572.0, 528.0)], kPTDemoSizeKey,
                         @"http://farm4.staticflickr.com/3338/3274183756_10411ace99_t.jpg", kPTDemoThumbnailKey,
                         nil],
                        
                        [NSDictionary dictionaryWithObjectsAndKeys:
                         @"http://farm8.staticflickr.com/7040/6888124857_df14f44fd7_b.jpg", kPTDemoSourceKey,
                         [NSValue valueWithCGSize:CGSizeMake(800.0, 613.0)], kPTDemoSizeKey,
                         @"http://farm8.staticflickr.com/7040/6888124857_df14f44fd7_t.jpg", kPTDemoThumbnailKey,
                         nil],
                        
                        [NSDictionary dictionaryWithObjectsAndKeys:
                         @"http://farm4.staticflickr.com/3503/3266055425_eed1ecc779_b.jpg", kPTDemoSourceKey,
                         [NSValue valueWithCGSize:CGSizeMake(1024.0, 768.0)], kPTDemoSizeKey,
                         @"http://farm4.staticflickr.com/3503/3266055425_eed1ecc779_t.jpg", kPTDemoThumbnailKey,
                         nil],
                        
                        [NSDictionary dictionaryWithObjectsAndKeys:
                         @"http://farm1.staticflickr.com/10/11621713_3ac2d1c5d7_b.jpg", kPTDemoSourceKey,
                         [NSValue valueWithCGSize:CGSizeMake(1024.0, 681.0)], kPTDemoSizeKey,
                         @"http://farm1.staticflickr.com/10/11621713_3ac2d1c5d7_t.jpg", kPTDemoThumbnailKey,
                         nil],
                        
                        nil];
    }
    return _exampleData;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Photos";
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
    
    ////////////////////////////////////////////////////////////////////////////
    
    /*
     * Decide which interface orientations do you want to support (we can handle
     * them all!)
     */
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown;
    }
    
    ////////////////////////////////////////////////////////////////////////////
    
    return YES;
}

#pragma mark - PTImageAlbumViewDataSource

- (NSInteger)numberOfImagesInAlbumView:(PTImageAlbumView *)imageAlbumView
{
    return [self.exampleData count];
}

- (NSString *)imageAlbumView:(PTImageAlbumView *)imageAlbumView sourceForImageAtIndex:(NSInteger)index
{
    return [[self.exampleData objectAtIndex:index] objectForKey:kPTDemoSourceKey];
}

- (CGSize)imageAlbumView:(PTImageAlbumView *)imageAlbumView sizeForImageAtIndex:(NSInteger)index
{
    return [[[self.exampleData objectAtIndex:index] objectForKey:kPTDemoSizeKey] CGSizeValue];
}

- (NSString *)imageAlbumView:(PTImageAlbumView *)imageAlbumView sourceForThumbnailImageAtIndex:(NSInteger)index
{
    return [[self.exampleData objectAtIndex:index] objectForKey:kPTDemoThumbnailKey];
}

@end
