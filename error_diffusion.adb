-- error_diffusion.adb
package body Error_Diffusion is

   procedure Diffuse_Image (
      Input_Image : in Image_Matrix;
      Output_Image : out Image_Matrix;
      Algorithm    : in Algorithm_Type
   ) is
      Rows : constant Integer := Input_Image'Length(1);
      Cols : constant Integer := Input_Image'Length(2);
      
      -- Work buffer to hold error-corrected values
      Buffer : Image_Matrix(1 .. Rows, 1 .. Cols) := Input_Image;
   begin
      -- Validate dimensions match
      if Output_Image'Length(1) /= Rows or Output_Image'Length(2) /= Cols then
         raise Invalid_Dimensions;
      end if;

      -- Iterate through pixels
      for R in 1 .. Rows loop
         for C in 1 .. Cols loop
            declare
               Old_Pixel : Float := Buffer(R, C);
               New_Pixel : Float := (if Old_Pixel > 127.5 then 255.0 else 0.0);
               Quant_Error : Float := Old_Pixel - New_Pixel;
            begin
               Output_Image(R, C) := New_Pixel;

               -- Diffusion logic (simplified example variant)
               -- In a real implementation, you would apply specific kernel weights
               -- to neighbors (R+1, C+1, etc) based on the Algorithm selected.
               if C + 1 <= Cols then
                  Buffer(R, C + 1) := Buffer(R, C + 1) + (Quant_Error * 0.4375);
               end if;
               if R + 1 <= Rows and C > 1 then
                  Buffer(R + 1, C - 1) := Buffer(R + 1, C - 1) + (Quant_Error * 0.1875);
               end if;
               if R + 1 <= Rows then
                  Buffer(R + 1, C) := Buffer(R + 1, C) + (Quant_Error * 0.3125);
               end if;
            end;
         end loop;
      end loop;
   end Diffuse_Image;

end Error_Diffusion;
