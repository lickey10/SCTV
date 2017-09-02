using System;
using System.Runtime.InteropServices;

namespace SCTV
{
    public class Speakers
    {
        // This is the only error code we will use
        public const int MMSYSERR_NOERROR = 0;

        //-------------------------------------------------------------------

        public const int MAXPNAMELEN = 32;

        public const int MIXER_SHORT_NAME_CHARS = 16;
        public const int MIXER_LONG_NAME_CHARS = 64;

        public const int MIXER_GETLINECONTROLSF_ONEBYTYPE = 2;
        public const int MIXER_GETLINEINFOF_COMPONENTTYPE = 3;

        public const int MIXER_GETCONTROLDETAILSF_VALUE = 0;
        public const int MIXER_SETCONTROLDETAILSF_VALUE = 0;

        //-------------------------------------------------------------------

        public const int MIXERCONTROL_CT_CLASS_SWITCH = 0x20000000;
        public const int MIXERCONTROL_CT_CLASS_FADER = 0x50000000;

        public const int MIXERCONTROL_CT_UNITS_BOOLEAN = 0x10000;
        public const int MIXERCONTROL_CT_UNITS_UNSIGNED = 0x30000;

        //-------------------------------------------------------------------

        public const int MIXERCONTROL_CONTROLTYPE_FADER =
            (MIXERCONTROL_CT_CLASS_FADER | MIXERCONTROL_CT_UNITS_UNSIGNED);

        public const int MIXERCONTROL_CONTROLTYPE_VOLUME =
            (MIXERCONTROL_CONTROLTYPE_FADER + 1);

        public const int MIXERCONTROL_CONTROLTYPE_BOOLEAN =
            (MIXERCONTROL_CT_CLASS_SWITCH | MIXERCONTROL_CT_UNITS_BOOLEAN);

        public const int MIXERCONTROL_CONTROLTYPE_MUTE =
            (MIXERCONTROL_CONTROLTYPE_BOOLEAN + 2);

        //-------------------------------------------------------------------

        // SRC COMPONENT TYPE
        public const int MIXERLINE_COMPONENTTYPE_SRC_FIRST = 0x1000;

        public const int MIXERLINE_COMPONENTTYPE_SRC_LINE = (MIXERLINE_COMPONENTTYPE_SRC_FIRST + 1);

        //-------------------------------------------------------------------

        // DST COMPONENT TYPE
        public const int MIXERLINE_COMPONENTTYPE_DST_SPEAKERS = 4;

        //-------------------------------------------------------------------

        // This is the callback notification which we use for synchronization
        public const int MM_MIXM_CONTROL_CHANGE = 0x3D1;

        //-------------------------------------------------------------------

        // This is the parameter used to enable .._CONTROL_CHANGE notifications
        public const int CALLBACK_WINDOW = 0x10000;

        //-------------------------------------------------------------------

        [DllImport("winmm.dll", CharSet = CharSet.Ansi)]                                                    // mixerOpen
        private static extern int mixerOpen(
                                        out int phmx,
                                        int uMxId,
                                        int dwCallback,
                                        int dwInstance,
                                        int fdwOpen );

        [DllImport("winmm.dll", CharSet = CharSet.Ansi)]                                                    // mixerClose
        private static extern int mixerClose( int hmx );

        [DllImport("winmm.dll", CharSet = CharSet.Ansi)]                                                    // mixerGetControlDetailsA
        private static extern int mixerGetControlDetailsA(
                                            int hmxobj,
                                            ref MIXERCONTROLDETAILS pmxcd,
                                            int fdwDetails );

        [DllImport("winmm.dll", CharSet = CharSet.Ansi)]                                                    // mixerGetLineControlsA
        private static extern int mixerGetLineControlsA(
                                            int hmxobj,
                                            ref MIXERLINECONTROLS pmxlc,
                                            int fdwControls );

        [DllImport("winmm.dll", CharSet = CharSet.Ansi)]                                                    // mixerGetLineInfoA
        private static extern int mixerGetLineInfoA(
                                            int hmxobj,
                                            ref MIXERLINE pmxl,
                                            int fdwInfo );

        [DllImport("winmm.dll", CharSet = CharSet.Ansi)]                                                    // mixerSetControlDetails
        private static extern int mixerSetControlDetails(
                                            int hmxobj,
                                            ref MIXERCONTROLDETAILS pmxcd,
                                            int fdwDetails );

        // -----------------------------------------------------------------------

        public struct MIXERCONTROL                                                                          // MIXERCONTROL
        {
            public int cbStruct;                    // Size in bytes of MIXERCONTROL
            public int dwControlID;                 // Unique control ID for mixer device
            public int dwControlType;               // MIXERCONTROL_CONTROLTYPE_xxx
            public int fdwControl;                  // MIXERCONTROL_CONTROLF_xxx
            public int cMultipleItems;              // If MIXERCONTROL_CONTROLF_MULTIPLE set

            [MarshalAs(UnmanagedType.ByValTStr,
            SizeConst = MIXER_SHORT_NAME_CHARS)]
            public string szShortName;              // Short name of control

            [MarshalAs(UnmanagedType.ByValTStr,
            SizeConst = MIXER_LONG_NAME_CHARS)]
            public string szName;                   // Long name of control

            public int lMinimum;                    // Minimum value
            public int lMaximum;                    // Maximum value

            [MarshalAs(UnmanagedType.U4,
            SizeConst = 10)]
            public int reserved;
        }

        public struct MIXERCONTROLDETAILS                                                                   // MIXERCONTROLDETAILS
        {
            public int cbStruct;                    // Size in bytes of MIXERCONTROLDETAILS
            public int dwControlID;                 // Control ID to get/set details on
            public int cChannels;                   // Number of channels in paDetails array
            public int item;                        // hwndOwner or cMultipleItems
            public int cbDetails;                   // Size of _one_details_XX struct
            public IntPtr paDetails;                // Pointer to array of details_XX_struct
        }

        public struct MIXERCONTROLDETAILS_UNSIGNED                                                          // MIXERCONTROLDETAILS_UNSIGNED
        {
            public int dwValue;
        }

        public struct MIXERLINE                                                                             // MIXERLINE
        {
            public int cbStruct;                    // Size of MIXERLINE struct
            public int dwDestination;               // Zero based destination index
            public int dwSource;                    // Zero based source index (if source)
            public int dwLineID;                    // Unique line ID for mixer device
            public int fdwLine;                     // State/information about line
            public int dwUser;                      // Driver specific information
            public int dwComponentType;             // Component type line connects to
            public int cChannels;                   // Number of channels line supports
            public int cConnections;                // Number of possible connections
            public int cControls;                   // Number of controls belonging to this line

            [MarshalAs(UnmanagedType.ByValTStr,
            SizeConst = MIXER_SHORT_NAME_CHARS)]
            public string szShortName;              // Short name of control

            [MarshalAs(UnmanagedType.ByValTStr,
            SizeConst = MIXER_LONG_NAME_CHARS)]
            public string szName;                   // Long name of control

            public int dwType;
            public int dwDeviceID;
            public int wMid;                        // Manufacturer ID                        
            public int wPid;                        // Product ID
            public int vDriverVersion;              // Driver Vers. No.

            [MarshalAs(UnmanagedType.ByValTStr,
            SizeConst = MAXPNAMELEN)]
            public string szPname;                  // Product name
        }

        public struct MIXERLINECONTROLS                                                                     // MIXERLINECONTROLS
        {
            public int cbStruct;                    // Size in bytes of MIXERLINECONTROLS
            public int dwLineID;                    // Line ID (from MIXERLINE.dwLineID)
                                                    // MIXER_GETLINECONTROLSF_ONEBYID or
            public int dwControl;                   // MIXER_GETLINECONTROLSF_ONEBYTYPE
            public int cControls;                   // Number of controls pamxctrl points to
            public int cbmxctrl;                    // Size in bytes of _one_ MIXERCONTROL
            public IntPtr pamxctrl;                 // Pointer to first MIXERCONTROL array
        }

        #region [Flags]
        [Flags]
        public enum SoundFlags : int
        {
            SND_SYNC = 0x0000,  // play synchronously (default) 
            SND_ASYNC = 0x0001,  // play asynchronously 
            SND_NODEFAULT = 0x0002,  // silence (!default) if sound not found 
            SND_MEMORY = 0x0004,  // pszSound points to a memory file
            SND_LOOP = 0x0008,  // loop the sound until next sndPlaySound 
            SND_NOSTOP = 0x0010,  // don't stop any currently playing sound 
            SND_NOWAIT = 0x00002000, // don't wait if the driver is busy 
            SND_ALIAS = 0x00010000, // name is a registry alias 
            SND_ALIAS_ID = 0x00110000, // alias is a predefined ID
            SND_FILENAME = 0x00020000, // name is file name 
            SND_RESOURCE = 0x00040004  // name is resource name or atom 
        }
        #endregion

        //volume variables
        // CONTROL TYPES
        public const int spkrVolumeControl = MIXERCONTROL_CONTROLTYPE_VOLUME;

        public const int spkrMuteControl = MIXERCONTROL_CONTROLTYPE_MUTE;

        // COMPONENT TYPES
        public int spkrComponent;

        // CONTROL IDs
        int spkrVolumeControlID = -1;
        int spkrMuteControlID = -1;

        const int spkrDown = 10;
        const int spkrUp = 11;

        int[] volSteps =    {       0,   2621,   5242,   7863,
                                10484,  13105,  15726,  18347,
                                20968,  23589,  26210,  28831,
                                31452,  34073,  36694,  39315,
                                41936,  44557,  47178,  49799,
                                52420,  55041,  57662,  60283,
                                62904,  65535 };

        int muteStatus = 0;

        private int volumeStep = 25;

        public int MuteStatus
        {
            get { return muteStatus; }
        }

        public Speakers()
        {
            spkrComponent = MIXERLINE_COMPONENTTYPE_DST_SPEAKERS;
        }

        #region Sound Functions
        #region static extern bool PlaySound
        [DllImport("winmm.dll", SetLastError = true, CallingConvention = CallingConvention.Winapi)]
        static extern bool PlaySound(string pszSound, IntPtr hMod, SoundFlags sf);
        #endregion

        private void PlayWaveFile(string filename)
        {
            int err = 0;

            //try
            //{
            //    // play the sound from the selected filename
            //    if (!PlaySound(filename, IntPtr.Zero, SoundFlags.SND_FILENAME | SoundFlags.SND_ASYNC))
            //    {
            //        Exception ex = new Exception("Error playing selected wav file");
            //        ExceptionManager.Publish(ex);
            //    }
            //}
            //catch
            //{
            //    err = Marshal.GetLastWin32Error();

            //    if (err != 0)
            //    {
            //        Exception ex = new Exception("Exception thrown trying to play selected wav file with error code " + err.ToString());
            //        ExceptionManager.Publish(ex);
            //    }
            //}
        }
        
        /// <summary>
        /// handles all volume controls
        /// </summary>
        /// <param name="direction"></param>
        public void Volume(string direction)
        {
            int v = 0;
            int i = 0;
            int iVol = 0;

            switch (direction)
            {
                case "volume up":
                    v = getVolume(spkrVolumeControl, spkrComponent);

                    i = -1;
                    do
                    {
                        i++;
                        iVol = volSteps[i];
                    }
                    while ((v >= iVol) && (i < volumeStep));

                    SetSpkrVolume(spkrVolumeControl, spkrComponent, iVol);
                    break;
                case "volume down":
                    v = getVolume(spkrVolumeControl, spkrComponent);

                    i = volumeStep + 1;
                    do
                    {
                        i--;
                        iVol = volSteps[i];
                    }
                    while ((v <= iVol) && (i > 0));

                    SetSpkrVolume(spkrVolumeControl, spkrComponent, iVol);
                    break;
                case "mute":
                    if (muteStatus == 1)
                        muteStatus = 0;
                    else
                        muteStatus = 1;

                    SetVolume(spkrMuteControl, spkrComponent, muteStatus);
                    break;
            }
        }

        public void Volume(double percentage)
        {
            int volIndex = 0;

            if (percentage > 0)
            {
                volIndex = (int)(Math.Round(volSteps.Length * percentage));

                int iVol = volSteps[volIndex];

                SetSpkrVolume(spkrVolumeControl, spkrComponent, iVol);
            }
        }

        public int GetVolume()
        {
            int volumeLevel = getVolume(spkrVolumeControl, spkrComponent);
            int returnPercentage = 0;

            for (int x = 0; x < volSteps.Length; x++)
            {
                if (volSteps[x] >= volumeLevel)
                {
                    if (x == 0)
                        returnPercentage = 0;
                    else
                        returnPercentage = (int)Math.Round((double)((decimal)x / (decimal)(volSteps.Length-1))*100, MidpointRounding.ToEven);

                    if (returnPercentage > 100)
                        returnPercentage = 100;

                    if (returnPercentage < 0)
                        returnPercentage = 0;

                    break;
                }
            }

            return returnPercentage;
        }

        /// <summary>
        /// sets speaker volume and updates graphics
        /// </summary>
        /// <param name="control"></param>
        /// <param name="component"></param>
        /// <param name="newVol"></param>
        private void SetSpkrVolume(int control, int component, int newVol)
        {
            // Set spkr volume to the next step value
            SetVolume(control, component, newVol);

            // Update the graphics
            //rectW = (int)((newVol / 65535.0) * rectWMax + 1);

            // This will prevent the volume bar from disappearing at near zero levels
            //rectW = rectW < 4 ? 4 : rectW;

            //gSpkr.FillRectangle(brushErase, rectX, rectY, rectWMax + 1, rectH);
            //gSpkr.FillRectangle(brushBlue, rectX, rectY, rectW, rectH);
        }
        #endregion

        // This function attempts to obtain a specified mixer control/component pair - 
        // returns true if successful.
        private static bool GetMixerControl(                                                                // GetMixerControl
                                        int hmixer,
                                        int component,
                                        int control,
                                        out MIXERCONTROL mxc,
                                        out int vCurrentVol )
        {
            bool retValue = false;
            mxc = new MIXERCONTROL();

            MIXERLINECONTROLS mxlc = new MIXERLINECONTROLS();
            MIXERLINE mxl = new MIXERLINE();
            MIXERCONTROLDETAILS pmxcd = new MIXERCONTROLDETAILS();
            MIXERCONTROLDETAILS_UNSIGNED du = new MIXERCONTROLDETAILS_UNSIGNED();

            vCurrentVol = -1;       // A dummy value

            mxl.cbStruct = Marshal.SizeOf(mxl);
            mxl.dwComponentType = component;

            int rc = mixerGetLineInfoA(
                                hmixer,
                                ref mxl,
                                MIXER_GETLINEINFOF_COMPONENTTYPE);

            if (MMSYSERR_NOERROR == rc)
            {
                int sizeofMIXERCONTROL = 152;
                int ctrl = Marshal.SizeOf(typeof(MIXERCONTROL));
                mxlc.pamxctrl = Marshal.AllocCoTaskMem(sizeofMIXERCONTROL);
                mxlc.cbStruct = Marshal.SizeOf(mxlc);
                mxlc.dwLineID = mxl.dwLineID;
                mxlc.dwControl = control;
                mxlc.cControls = 1;
                mxlc.cbmxctrl = sizeofMIXERCONTROL;

                // Allocate a buffer for the control 
                mxc.cbStruct = sizeofMIXERCONTROL;

                // Get the control 
                rc = mixerGetLineControlsA(
                                        hmixer,
                                        ref mxlc,
                                        MIXER_GETLINECONTROLSF_ONEBYTYPE);

                if (MMSYSERR_NOERROR == rc)
                {
                    retValue = true;
                    // Copy the control into the destination structure 
                    mxc = (MIXERCONTROL)Marshal.PtrToStructure(
                                                            mxlc.pamxctrl,
                                                            typeof(MIXERCONTROL));
                }

                int sizeofMIXERCONTROLDETAILS =
                    Marshal.SizeOf(typeof(MIXERCONTROLDETAILS));

                int sizeofMIXERCONTROLDETAILS_UNSIGNED =
                    Marshal.SizeOf(typeof(MIXERCONTROLDETAILS_UNSIGNED));

                pmxcd.cbStruct = sizeofMIXERCONTROLDETAILS;
                pmxcd.dwControlID = mxc.dwControlID;
                pmxcd.paDetails = Marshal.AllocCoTaskMem(sizeofMIXERCONTROLDETAILS_UNSIGNED);
                pmxcd.cChannels = 1;
                pmxcd.item = 0;
                pmxcd.cbDetails = sizeofMIXERCONTROLDETAILS_UNSIGNED;

                rc = mixerGetControlDetailsA(
                                    hmixer,
                                    ref pmxcd,
                                    MIXER_GETCONTROLDETAILSF_VALUE);

                du = (MIXERCONTROLDETAILS_UNSIGNED)Marshal.PtrToStructure(
                                                            pmxcd.paDetails,
                                                            typeof(MIXERCONTROLDETAILS_UNSIGNED));

                vCurrentVol = du.dwValue;

                return retValue;    // true
            }

            return retValue;        // false
        }

        private static bool SetVolumeControl(                                                               // SetVolumeControl
                                    int hmixer,
                                    MIXERCONTROL mxc,
                                    int volume )
        {
            bool retValue = false;
            int rc;

            MIXERCONTROLDETAILS mxcd = new MIXERCONTROLDETAILS();
            MIXERCONTROLDETAILS_UNSIGNED vol = new MIXERCONTROLDETAILS_UNSIGNED();

            mxcd.item = 0;
            mxcd.dwControlID = mxc.dwControlID;
            mxcd.cbStruct = Marshal.SizeOf(mxcd);
            mxcd.cbDetails = Marshal.SizeOf(vol);

            // Allocate a buffer for the control value buffer 
            mxcd.cChannels = 1;
            vol.dwValue = volume;

            // Copy the data into the control value buffer 
            mxcd.paDetails = Marshal.AllocCoTaskMem(
                                Marshal.SizeOf(typeof(MIXERCONTROLDETAILS_UNSIGNED)));

            Marshal.StructureToPtr(
                                vol,
                                mxcd.paDetails,
                                false);

            // Set the control value 
            rc = mixerSetControlDetails(
                                    hmixer,
                                    ref mxcd,
                                    MIXER_SETCONTROLDETAILSF_VALUE);

            return retValue = MMSYSERR_NOERROR == rc ? true : false;
        }

        private static int getVolume( int control, int component )                                             // GetVolume
        {
            int hmixer = 0;
            int currVol = -1;

            MIXERCONTROL volCtrl = new MIXERCONTROL();

            int rc = mixerOpen(
                            out hmixer,
                            0,
                            0,
                            0,
                            0);

            bool b = GetMixerControl(
                                hmixer,
                                component,
                                control,
                                out volCtrl,        // Not used
                                out currVol);

            mixerClose(hmixer);

            return currVol;
        }

        public static void SetVolume( int control, int component, int newVol )                              // SetVolume
        {
            int hmixer = 0;
            int currentVol;

            MIXERCONTROL volCtrl = new MIXERCONTROL();

            mixerOpen(
                    out hmixer,
                    0,
                    0,
                    0,
                    0);

            GetMixerControl(
                        hmixer,
                        component,
                        control,
                        out volCtrl,
                        out currentVol);            // Not used

            SetVolumeControl(hmixer, volCtrl, newVol);

            mixerClose(hmixer);
        }

        public static bool MonitorControl( int iw )     // iw is the window handle                          // MonitorControl
        {
            int rc = -1;
            bool retValue = false;

            int hmixer;
            rc = mixerOpen(
                        out hmixer,
                        0,
                        iw,
                        0,
                        CALLBACK_WINDOW);

            return retValue = (MMSYSERR_NOERROR == rc) ? true : false;
        }

        public static int CheckMixer()                                                                      // CheckMixer
        {
            int retValue = -1;
            int rc1, rc2 = -1;
            int hmixer;

            rc1 = mixerOpen(
                        out hmixer,
                        0,
                        0,
                        0,
                        0);

            rc2 = mixerClose(hmixer);

            return retValue = (MMSYSERR_NOERROR == rc1) && (MMSYSERR_NOERROR == rc2) ? MMSYSERR_NOERROR : retValue;
        }

        public static int GetControlID( int component, int control )                                        // GetControlID
        {
            MIXERCONTROL mxc = new MIXERCONTROL();
            int _i;         // Though we won't need _i, it still must be declared                                    

            bool b = false;
            int retValue = 0;

            b = GetMixerControl(
                            0,
                            component,
                            control,
                            out mxc,
                            out _i);

            return retValue = b ? mxc.dwControlID : -1;
        }
    }
}
