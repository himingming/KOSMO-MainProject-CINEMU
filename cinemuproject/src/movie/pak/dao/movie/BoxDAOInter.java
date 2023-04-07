package movie.pak.dao.movie;

import java.util.List;
import java.util.Map;

import movie.pak.dto.BoxDTO;
import movie.pak.dto.MovieCommDTO;
import movie.pak.dto.MovieUpDTO;

public interface BoxDAOInter {

public List<BoxDTO> boxList();
// 예매율을 가져오기 위한 DAO
public List<Float> getratio();
}
