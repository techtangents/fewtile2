module Techtangents.Layout.Gridify where


type RowLayout  = {rows:Int, cols:Int, cells:Int, w:Int, h:Int, ar:Float}
type GridLayout = {rows:Int, cells:Int, rowLayouts:[RowLayout]}

gridify : Float -> Int -> Int -> Int -> GridLayout 
gridify aspectRatio totalWidth totalHeight numCells =
  let
    rows = aspectRatio * totalHeight * numCells / totalWidth
           |> sqrt 
           |> round 
           |> clamp 1 numCells

    normalCols = floor(numCells / rows);
    skinnyCols = normalCols + 1;

    skinnyRows = numCells % rows;
    normalRows = rows - skinnyRows;
    
    h = totalHeight / rows;

    f r c =
      let 
        cells = r * c
        w = totalWidth / c
        ar = w / h
      in 
        { rows = r
        , cols = c
        , cells = cells
        , w = w
        , h = h
        , ar = ar
        }
    
    normal = f normalRows normalCols
    rowLayouts = if skinnyRows == 0 
                    then [normal] 
                    else [normal, f skinnyRows skinnyCols]

    sumArs = sum <| map (\r -> r.ar * r.cells) rowLayouts

    meanAr = sumArs / numCells;

  in 
    { rows = rows
    , cells = numCells
    , rowLayouts = rowLayouts
    , meanAr = meanAr
    }
   