const { Op } = require("sequelize");
const { User, Recording, Project } = require("../models");
const axios = require("axios");

const registerMusisi = async (req, res) => {
  const { user_id } = req.user; // Mengambil user_id dari objek user di dalam req
  const formattedUserId = user_id.toString().toUpperCase();

  try {
    const [updatedCount] = await User.update(
      { role: "musisi" }, // Peran baru yang akan diupdate
      { where: { user_id: formattedUserId } } // Kondisi untuk menemukan pengguna yang akan diupdate
    );

    if (updatedCount === 0) {
      return res.status(404).json({ error: "User not found" });
    }

    return res.json({ message: "Successfully registered as a musician" });
  } catch (error) {
    console.error(error);
    return res.status(500).json({ error: "Internal server error" });
  }
};

const uploadRecording = async (req, res) => {
  const { song_title, project_id } = req.body;

  const options = {
    method: "GET",
    url: "https://spotify23.p.rapidapi.com/search/",
    params: {
      q: song_title,
      type: "tracks",
      offset: "0",
      limit: "1",
      numberOfTopResults: "1",
    },
    headers: {
      "X-RapidAPI-Key": "9f5928328dmsh2a7db1a70c1d5d6p19fa82jsn66299a07abdb",
      "X-RapidAPI-Host": "spotify23.p.rapidapi.com",
    },
  };

  try {
    const response = await axios.request(options);

    if (!response.data.tracks.items.length) {
      return res.status(404).json({ error: "Track not found" });
    }

    const { uri, id, name } = response.data.tracks.items[0].data;
    const filteredResponse = {
      record_track: `https://open.spotify.com/intl-id/track/${id}`,
      title: name,
    };

    // Assuming you have the 'Recording' model imported
    const recording = await Recording.create({
      recording_id: await generateRecordingId(), // Implement your own function to generate the recording ID
      project_id: project_id, // Assuming you have 'project_id' available in the request parameters
      musician_id: req.user.user_id, // Assuming you have the authenticated user available
      title: filteredResponse.title,
      song_url: filteredResponse.record_track,
    });

    const filteredResponseUpload = {
      message: "Recording uploaded successfully",
      recording: {
        recording_id: recording.recording_id,
        project_id: recording.project_id,
        musician_id: recording.musician_id,
        title: recording.title,
        song_url: recording.song_url,
      },
    };

    return res.status(201).json(filteredResponseUpload);
  } catch (error) {
    console.error(error);
    return res.status(500).json({ error: "Internal server error" });
  }
};

const getRecording = async (req, res) => {
  const { title } = req.query;

  try {
    let recordings;

    if (title) {
      recordings = await Recording.findAll({
        attributes: ["recording_id", "title", "song_url"],
        include: [
          {
            model: Project,
            as: "project",
            attributes: ["title"],
          },
          {
            model: User,
            as: "musician",
            attributes: ["name"],
          },
        ],
        where: {
          title: { [Op.like]: `%${title}%` },
        },
      });
    } else {
      recordings = await Recording.findAll({
        attributes: ["recording_id", "title", "song_url"],
        include: [
          {
            model: Project,
            as: "project",
            attributes: ["title"],
          },
          {
            model: User,
            as: "musician",
            attributes: ["name"],
          },
        ],
      });
    }

    const formattedRecordings = recordings.map((recording) => ({
      recording_id: recording.recording_id,
      project_title: recording.project.title,
      musician: recording.musician.name,
      title: recording.title,
      song_url: recording.song_url,
    }));

    return res.json({
      message: "Successfully retrieved recordings",
      recordings: formattedRecordings,
    });
  } catch (error) {
    console.error(error);
    return res.status(500).json({ error: "Internal server error" });
  }
};

const getDetailRecording = async (req, res) => {
  const { recording_id } = req.params;

  try {
    const recording = await Recording.findByPk(recording_id, {
      attributes: ["recording_id", "title", "song_url"],
      include: [
        {
          model: Project,
          as: "project",
          attributes: ["title"],
        },
        {
          model: User,
          as: "musician",
          attributes: ["name"],
        },
      ],
    });

    if (!recording) {
      return res.status(404).json({ error: "Recording not found" });
    }

    const formattedRecording = {
      recording_id: recording.recording_id,
      project_title: recording.project.title,
      musician: recording.musician.name,
      title: recording.title,
      song_url: recording.song_url,
    };

    return res.json({
      recording: formattedRecording,
    });
  } catch (error) {
    console.error(error);
    return res.status(500).json({ error: "Internal server error" });
  }
};

const updateRecording = async (req, res) => {
  const { recording_id } = req.params;
  const { song_title } = req.body;

  try {
    // Step 1: Ambil rekaman yang ingin diupdate
    const recording = await Recording.findByPk(recording_id);

    if (!recording) {
      return res.status(404).json({ error: 'Recording not found' });
    }

    // Step 2: Ambil data baru menggunakan Axios
    const options = {
      method: 'GET',
      url: 'https://spotify23.p.rapidapi.com/search/',
      params: {
        q: song_title,
        type: 'tracks',
        offset: '0',
        limit: '1',
        numberOfTopResults: '1',
      },
      headers: {
        'X-RapidAPI-Key': '9f5928328dmsh2a7db1a70c1d5d6p19fa82jsn66299a07abdb',
        'X-RapidAPI-Host': 'spotify23.p.rapidapi.com',
      },
    };

    const response = await axios.request(options);

    if (!response.data.tracks.items.length) {
      return res.status(404).json({ error: 'Track not found' });
    }

    const { uri, id, name } = response.data.tracks.items[0].data;
    const filteredResponse = {
      record_track: `https://open.spotify.com/intl-id/track/${id}`,
      title: name,
    };

    // Step 3: Update rekaman dengan data baru
    recording.title = filteredResponse.title;
    recording.song_url = filteredResponse.record_track;

    await recording.save();

    // Step 4: Response dengan informasi terbaru rekaman
    const filteredResponseUpdate = {
      title: recording.title,
      song_url: recording.song_url,
    };

    return res.json({ message: 'Recording updated successfully', recording: filteredResponseUpdate });
  } catch (error) {
    console.error(error);
    return res.status(500).json({ error: 'Internal server error' });
  }
};

module.exports = {
  registerMusisi,
  uploadRecording,
  getRecording,
  getDetailRecording,
  updateRecording,
};

const generateRecordingId = async () => {
  try {
    const maxRecordingId = await Recording.max("recording_id");
    let recordingId;
    if (maxRecordingId) {
      const lastId = Number(maxRecordingId.substr(1));
      const nextId = lastId + 1;
      recordingId = `R${nextId.toString().padStart(3, "0")}`;
    } else {
      recordingId = "R001";
    }
    return recordingId;
  } catch (error) {
    throw new Error("Failed to generate recording ID");
  }
};
