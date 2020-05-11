%% Part 5
  func = @(conv) MatrixMakerQ5(conv);
  a = fzero(func, 0.2);
    
  disp("This is the optimum conversion rate: " + a + " mols of EDC converted/EDC fed" );

