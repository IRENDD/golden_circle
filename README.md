# Golden Circle

<img src="https://github.com/IRENDD/golden_circle/assets/98989079/b653e133-eff4-408a-b6ee-cfed63962704" width="650" height="350">

## About the project
An platform dedicated to combating the pervasive issue of loneliness among the elderly population. Our mission is to foster a vibrant community where older people can effortlessly discover events tailored specifically to their interests and host their own events. This initiative not only enriches the social lives of our esteemed senior members but also cultivates a sense of belonging and connection within this distinguished community.

## UN Taget Goals

<img src="https://github.com/IRENDD/golden_circle/assets/98989079/03084716-574d-4905-9487-7786efb8c060" width="450" height="450">

Our team has chosen to focus on the "Good Health and Wellbeing" target, with a specific emphasis on addressing Goal 3.4.2, aimed at reducing the suicide mortality rate. Disturbing statistics from recent studies indicate that around one in four older adults worldwide is in danger of suicide attempts, a situation largely attributed to solitude and a lack of social ties (Cleveland Clinic, 2023). Particularly vulnerable are those who have recently lost a spouse and find themselves without nearby family or friends, underscoring the critical need for social engagement. This segment constitutes 16.8% of the global populace yet alarmingly contributes to 22% of total suicide incidences (Centers for Disease Control and Prevention, 2023). Regarding local the circumstances in Hong Kong, the year 2022 saw a total of 477 suicides among this age demographic, representing 44.17% of the overall suicide fatalities. This figure marks an increase of 6.95% from the previous year, 2021 (Samaritan Befrienders Hong Kong, 2023).

In response to this urgent issue, our initiative seeks to combat loneliness among the elderly by creating a platform that fosters opportunities for older people for socialization and the creation of shared experiences. Through our efforts, we aim to provide older adults with the resources and platforms they need to build meaningful connections and thrive, thereby addressing a significant root cause of suicide within this population.

Reference List

1.Cleveland Clinic. (2023, December 12). What to know about older adults and suicide risk. https://health.clevelandclinic.org/suicide-in-older-adults  

2.Centers for Disease Control and Prevention. (2023, November 29). Suicide data and statistics. https://www.cdc.gov/suicide/suicide-data-statistics.html  

3.Samaritan Befrienders Hong Kong. (2023). Empowering the inner-self 2022 Annual Report. https://sbhk.org.hk/wp-content/uploads/2023/07/2022-Annual-Report-2.pdf

## How to run the code?

### Installations
  1. As our product testing was done on the android platform primarily, we recommend installing the latest version of the android studio application (link below).
  https://developer.android.com/studio
  
  2. After the successful installation of android studio, please install/create the AVD to launch the Google Pixel 6 Pro (api 30) mobile phone which can be done using the instructions found in the following web page.
  https://developer.android.com/studio/run/managing-avds
  
  3. Once completed, please install the flutter sdk package (which comes with the dart sdk). Otherwise, please separately install the dart sdk folder into the host computer’s memory. (please remember the location where these files are saved as it will be useful later)
  Flutter SDK (link): https://docs.flutter.dev/get-started/install?_gl=1*5krvao*_up*MQ..&gclid=CjwKCAiA_5WvBhBAEiwAZtCU7wqj3Iiz7wEpeDJjTO6QJ7wXueCH0Q7ZVQjY3U5TD2tKhgvuUuOW7xoC6JMQAvD_BwE&gclsrc=aw.ds
  
  4. Lastly, we recommend using the VSCode editor to deploy the application. However, if you are not comfortable with doing so, please do use a code editor of your choice.
  https://code.visualstudio.com/download

### Configuration
  1. To begin executing our program, first navigate to the code directory on your computer and open the application with VSCode or the editor of your choice.

  2. Next, please configure the location of the flutter sdk (using the file location where it was saved on the host computer)

  3. Lastly, ensure that the android emulator is connected to your code editor (using the android sdk)
  [Reference for android studio: https://developer.android.com/studio/run/emulator#avd]

### Running
  1. Once all the above steps are complete. We can begin the execution process rather easily.

  2. First, run pub get on the pubspec.yaml file to ensure all dependencies for the application have been loaded.

  3. Next, select the ADV you would like to use to deploy the application. We highly recommend Google Pixel 6 Pro API 30 (as mentioned during the installation sub-section)

  4. Lastly, navigate to the main.dart file and run the code segment within the debug mode. This will deploy an instance of the ADV on your host computer and launch the application within it.


For any queries concerning any of these processes, please contact Sidharth Sreekumar at sidharth.kts05@gmail.com
