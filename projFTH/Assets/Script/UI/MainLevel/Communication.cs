namespace Script.UI.MainLevel
{
    using UnityEngine;
    using UnityEngine.SceneManagement;

    public class Communication : MonoBehaviour
    {
        // Start is called before the first frame update
        void Start()
        {

        }

        // Update is called once per frame
        void Update()
        {

        }

        public void OnClickMainLevel()
        {
            SceneManager.LoadScene("MainLevel_s");
        }

    }
}