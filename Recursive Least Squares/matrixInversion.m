function result = matrixInversion(invA, B, C, D)
% DESCRIPTION: matrixInversion implements the Matrix Inversion Lemma
% INPUTS: Matrices A^-1, B, C, D (assuming that A^-1 is provided)
% OUTPUTS: The calculated (A + BCD)^-1
    result = invA - invA * B * inv(inv(C) + D * invA * B) * D * invA;
end