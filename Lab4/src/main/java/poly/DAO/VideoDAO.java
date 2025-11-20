package poly.DAO;

import poly.entity.Video;

import java.util.List;

public interface VideoDAO extends GenericDAO<Video, String> {

    // Bài 3: tìm video theo keyword trong title
    List<Video> findByKeyword(String keyword);
}