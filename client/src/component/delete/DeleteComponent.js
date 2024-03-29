import React from "react";
import axios from "axios";
import './delete.css'

const DeleteComponent = ({ id, onDeleteHandler }) => {
  const url = `http://ec2-54-224-245-13.compute-1.amazonaws.com:5002/videos/data/${id}`;

  const deleteVideo = async () => {
    try {
      const res = await axios.delete(url);
      if (res.status === 200) {
        alert("This Video has been deleted successfully");
      } else {
        alert("Video for ID requested is not found");
      }
    } catch (error) {
      console.log(error);
    }
    onDeleteHandler();
  };
  
  const authorization = () => {
    deleteVideo();
  };

  return (
    <div>
      <button className="btn-delete" onClick={authorization}>
        Delete Video
        <span></span>
      </button>
    </div>
  );
};

export default DeleteComponent;
